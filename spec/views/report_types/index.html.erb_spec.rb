require 'rails_helper'

RSpec.describe "report_types/index", type: :view do
  before(:each) do
    assign(:report_types, [
      ReportType.create!(
        :title => "Ultrasound Type",
        :content => "MyText"
      ),
      ReportType.create!(
        :title => "Ultrasound Type",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of report_types" do
    render
    assert_select "tr>td", :text => "Ultrasound Type".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
