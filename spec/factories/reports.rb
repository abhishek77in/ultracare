FactoryGirl.define do

  factory :report do
    referrer
    referrer_name 'referrer'
    patient
    title 'title'
    content 'content'
  end
end
