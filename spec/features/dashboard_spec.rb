require 'rails_helper'

feature "show header with Ultracare" do
  scenario "referrer visits dashboard" do
    visit '/'
    expect(page).to have_text("Ultracare")
  end
end
