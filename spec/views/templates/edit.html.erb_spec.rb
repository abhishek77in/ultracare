require 'rails_helper'

RSpec.describe "templates/edit", type: :view do
  before(:each) do
    @template = assign(:template, Template.create!(
      :ultrasound_type => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit template form" do
    render

    assert_select "form[action=?][method=?]", template_path(@template), "post" do

      assert_select "input#template_ultrasound_type[name=?]", "template[ultrasound_type]"

      assert_select "textarea#template_content[name=?]", "template[content]"
    end
  end
end
