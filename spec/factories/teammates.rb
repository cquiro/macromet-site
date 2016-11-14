FactoryGirl.define do
  factory :teammate do
    name "James Bond"
    position "Spy"
    bio "Tomorrow Never Dies"
    photo "007"

    factory :invalid_teammate do
      name nil
    end
  end
end
