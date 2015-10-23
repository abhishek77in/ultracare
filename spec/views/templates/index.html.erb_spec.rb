require 'rails_helper'

RSpec.describe "templates/index", type: :view do
  before(:each) do
    assign(:templates, [
      Template.create!(
        :ultrasound_type => "Ultrasound Type",
        :content => "MyText"
      ),
      Template.create!(
        :ultrasound_type => "Ultrasound Type",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of templates" do
    render
    assert_select "tr>td", :text => "Ultrasound Type".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end