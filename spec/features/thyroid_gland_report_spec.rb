require 'rails_helper'

feature "print a thyroid gland usg report" do
  before do
    FactoryGirl.create(:setting)
    @doctor = FactoryGirl.create(:doctor)
  end

  scenario "doctor tries to create a new report and print it" do
    visit '/'
    click_link 'Thyroid Gland'

    fill_in('Name', with: 'Jon Doe')
    select(@doctor.doctor_name, from: 'Referred By Doctor')
    fill_in('Age', with: '27')
    select('Female', from: 'Sex')

    click_button('Create Report')

    expect(page).to have_text("Jon Doe")
    expect(page).to have_text(@doctor.doctor_name)
    expect(page).to have_text("27")
    expect(page).to have_text("F")
    expect(page).to have_text("Edit")
    expect(page).to have_text("Print")
  end
end
