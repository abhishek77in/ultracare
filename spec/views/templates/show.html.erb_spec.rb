require 'rails_helper'

RSpec.describe "templates/show", type: :view do
  before(:each) do
    skip
    @template = assign(:template, Template.create!(
      :report_title => "Ultrasound Type",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Ultrasound Type/)
    expect(rendered).to match(/MyText/)
  end
end
