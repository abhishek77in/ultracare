FactoryGirl.define do

  factory :report_type do
    association :reportable, factory: :thyroid_gland
  end
end
