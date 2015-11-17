FactoryGirl.define do
  sequence(:referrer_name) { |n| "#{n} Referrer" }

  factory :referrer do
    name { generate(:referrer_name) }
  end
end
