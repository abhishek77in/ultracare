FactoryGirl.define do
  sequence(:doctor_name) { |n| "Jon Doe #{n}" }

  factory :doctor do
    name { generate(:doctor_name) }
  end
end
