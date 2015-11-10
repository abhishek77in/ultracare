FactoryGirl.define do
  sequence :report_title do |n|
    "#{n} report_title"
  end

  sequence :template_name do |n|
    "#{n} template name"
  end

  factory :template do
    name  { generate(:template_name) }
    report_title
    content 'test report content'
  end
end
