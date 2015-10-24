require 'rails_helper'

RSpec.describe "report_types/edit", type: :view do
  before(:each) do
    skip
    report_type = assign(:report_type, ReportType.create!(
      :title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit report_type form" do
    render

    assert_select "form[action=?][method=?]", report_type_path(report_type), "post" do

      assert_select "input#template_title[name=?]", "report_type[title]"

      assert_select "textarea#template_content[name=?]", "report_type[content]"
    end
  end
end
