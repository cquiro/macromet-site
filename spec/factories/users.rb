FactoryGirl.define do
  factory :user do
    name "James Bond"
    email "james@bond.com"
    password "password"
    password_confirmation "password"
  end
end
