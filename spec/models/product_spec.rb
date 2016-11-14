require 'rails_helper'

RSpec.describe Product, type: :model do
  it "has a valid factory" do
    expect(build(:product)).to be_valid
  end

  it "is invalid without a name" do
    product = build(:product, name: nil)
    product.valid?
    expect(product.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a description" do
    product = build(:product, description: nil)
    product.valid?
    expect(product.errors[:description]).to include("can't be blank")
  end

  it "is invalid without a client" do
    product = build(:product, client: nil)
    product.valid?
    expect(product.errors[:client]).to include("can't be blank")
  end

  it "is invalid without a product_line" do
    product = build(:product, product_line: nil)
    product.valid?
    expect(product.errors[:product_line]).to include("can't be blank")
  end
  # it "is invalid without a photo"
end
