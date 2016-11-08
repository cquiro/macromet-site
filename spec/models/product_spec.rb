require 'rails_helper'

RSpec.describe Product, type: :model do
  it "is valid with name, description, client, product_line and photo" do
    product = Product.new(
      name: "Grill",
      description: "Charcoal kettle grill",
      client: "Weber",
      product_line: "Soluciones",
      photo: "Some image")

    expect(product).to be_valid
  end

  it "is invalid without a name" do
    product = Product.new(name: nil)
    product.valid?
    expect(product.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a description" do
    product = Product.new(description: nil)
    product.valid?
    expect(product.errors[:description]).to include("can't be blank")
  end

  it "is invalid without a client" do
    product = Product.new(client: nil)
    product.valid?
    expect(product.errors[:client]).to include("can't be blank")
  end

  it "is invalid without a product_line" do
    product = Product.new(product_line: nil)
    product.valid?
    expect(product.errors[:product_line]).to include("can't be blank")
  end
  # it "is invalid without a photo"
end
