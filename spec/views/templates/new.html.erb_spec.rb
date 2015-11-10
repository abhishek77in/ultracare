require 'rails_helper'

RSpec.describe "templates/new", type: :view do
  before(:each) do
    assign(:template, Template.new(
      :name => "MyString",
      :report_title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders new template form" do
    skip
    render

    assert_select "form[action=?][method=?]", templates_path, "post" do

      assert_select "input#template_title[name=?]", "template[report_title]"

      assert_select "textarea#template_content[name=?]", "template[content]"
    end
  end
end
