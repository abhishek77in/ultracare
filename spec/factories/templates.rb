FactoryGirl.define do
  sequence :report_title do |n|
    "#{n} report_title"
  end

  factory :template do
    report_title
    content 'test report content'
  end
end
