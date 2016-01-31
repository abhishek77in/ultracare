require 'rails_helper'

feature "show header with Ultracare" do
  before do
    FactoryGirl.create(:setting)
  end

  scenario "referrer visits dashboard" do
    visit '/'
    expect(page).to have_text("Ultracare")
  end
end
