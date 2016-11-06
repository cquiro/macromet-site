require 'rails_helper'

RSpec.describe Teammate, type: :model do
  it "has a valid factory" do
    expect(build(:teammate)).to be_valid
  end

  it "is valid with a name, position and photo" do
    teammate = build(:teammate) 

    expect(teammate).to be_valid
  end

  it "is invalid without a name" do
    teammate = build(:teammate, name: nil)
    teammate.valid?
    expect(teammate.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a position" do 
    teammate = build(:teammate, position: nil)
    teammate.valid?
    expect(teammate.errors[:position]).to include("can't be blank")
  end

  # it "is invalid without a photo" do
  #   teammate = build(:teammate, photo: nil) 
  #   teammate.valid?
  #   expect(teammate.errors[:photo]).to include("can't be blank")
  # end

  it "is valid without a bio" do
    teammate = build(:teammate, bio: nil) 
    teammate.valid?
    expect(teammate.errors[:bio]).not_to include("can't be blank")
  end
end
