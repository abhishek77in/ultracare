FactoryGirl.define do
  sequence(:name) { |n| "Jon Doe #{n}" }

  factory :referrer do
    name
  end
end
