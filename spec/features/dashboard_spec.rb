require 'rails_helper'

feature "show header with ultrasound unit's name on header" do
  before do
    @setting = FactoryGirl.create(:setting, print_settings: {heading: 'My ultrasound unit'})
  end

  scenario "doctor visits dashboard" do
    visit '/'
    expect(page).to have_text("MY ULTRASOUND UNIT")
  end
end
