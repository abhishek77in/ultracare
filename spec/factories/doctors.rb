FactoryGirl.define do
  sequence(:doctor_name) { |n| "Doctor #{n}" }

  factory :doctor do
    name { generate(:doctor_name) }
  end
end
