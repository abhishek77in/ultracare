require 'rails_helper'

RSpec.describe "templates/edit", type: :view do
  before(:each) do
    @template = assign(:template, Template.create!(
      :name => "MyString",
      :report_title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit template form" do
    skip
    render

    assert_select "form[action=?][method=?]", template_path(@template), "post" do

      assert_select "input#template_title[name=?]", "template[report_title]"

      assert_select "textarea#template_content[name=?]", "template[content]"
    end
  end
end
