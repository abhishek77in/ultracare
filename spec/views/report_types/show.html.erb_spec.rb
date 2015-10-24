require 'rails_helper'

RSpec.describe "report_types/show", type: :view do
  before(:each) do
    skip
    report_type = assign(:report_type, ReportType.create!(
      :title => "Ultrasound Type",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Ultrasound Type/)
    expect(rendered).to match(/MyText/)
  end
end
