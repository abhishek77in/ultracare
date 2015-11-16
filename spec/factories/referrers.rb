FactoryGirl.define do
  sequence(:referrer_name) { |n| "Jon Doe #{n}" }

  factory :referrer do
    name { generate(:referrer_name) }
  end
end
