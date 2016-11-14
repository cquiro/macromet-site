FactoryGirl.define do
  factory :product do
    name "Grill"
    description "Charcoal kettle grill"
    client "Weber"
    product_line "Soluciones"
    photo "Some Image"

    factory :invalid_product do
      name nil
    end
  end
end
