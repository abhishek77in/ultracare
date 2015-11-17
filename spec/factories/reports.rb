FactoryGirl.define do

  factory :report do
    referrer
    patient
    title 'title'
    content 'content'
  end
end
