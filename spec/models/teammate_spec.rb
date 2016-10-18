require 'rails_helper'

RSpec.describe Teammate, type: :model do
  it "is valid with a name, position and photo" do
    teammate = Teammate.new(
      name: "James Bond",
      position: "Spy",
      photo: "image")

    expect(teammate).to be_valid
  end

  it "is invalid without a name" do
    teammate = Teammate.new(name: nil)
    teammate.valid?
    expect(teammate.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a position" do 
    teammate = Teammate.new(position: nil)
    teammate.valid?
    expect(teammate.errors[:position]).to include("can't be blank")
  end

  it "is invalid without a photo" do
    teammate = Teammate.new(photo: nil)
    teammate.valid?
    expect(teammate.errors[:photo]).to include("can't be blank")
  end
end
