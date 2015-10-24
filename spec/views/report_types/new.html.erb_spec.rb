require 'rails_helper'

RSpec.describe "report_types/new", type: :view do
  before(:each) do
    skip
    assign(:report_type, ReportType.new(
      :title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders new report_type form" do
    render

    assert_select "form[action=?][method=?]", templates_path, "post" do

      assert_select "input#template_title[name=?]", "report_type[title]"

      assert_select "textarea#template_content[name=?]", "report_type[content]"
    end
  end
end
