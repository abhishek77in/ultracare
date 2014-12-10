FactoryGirl.define do
  sequence(:name) { |n| "Jon Doe #{n}" }

  factory :doctor do
    name
  end
end
