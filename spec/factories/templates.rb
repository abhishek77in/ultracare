FactoryGirl.define do
  sequence :title do |n|
    "#{n} title"
  end

  factory :template do
    title
    content 'test report content'
  end
end
