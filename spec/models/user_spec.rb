require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "is valid with name, email and password" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a name" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "is invalid without an email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
  end

  describe "#generate_password_reset_token!" do
    let(:user) { create(:user) }
    it "changes the password_reset_token_attribute" do
      expect {
        user.generate_password_reset_token!
      }.to change { user.password_reset_token }
    end

    it "calls SecureRandom.urlsafe_base64 to generate the password_reset_token" do
      expect(SecureRandom).to receive(:urlsafe_base64)
      user.generate_password_reset_token!
    end
  end
end
