require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "is valid with name, email and password"
    it "is invalid without a name"
    it "is invalid without an email"
    it "is invalid without a password"
  end
end
