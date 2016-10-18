require 'rails_helper'

RSpec.describe Teammate, type: :model do
  it "is valid with a name, position and photo" do
    teammate = Teammate.new(
      name: "James Bond",
      position: "Spy",
      photo: "image")

    expect(teammate).to be_valid
  end
  it "is invalid without a name"
  it "is invalid without a position"
  it "is invalid without an image"
end
