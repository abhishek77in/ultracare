require 'rails_helper'

feature "print a thyroid gland usg report" do
  before do
    FactoryGirl.create(:setting, default_organ_findings: {thyroid_left_lobe: "ABNORMAL"})
    @doctor = FactoryGirl.create(:doctor)
  end

  scenario "doctor tries to create a new report and print it" do
    pending
    visit '/'
    click_link 'Thyroid Gland'

    fill_in('Name', with: 'Jon Doe')
    select(@doctor.doctor_name, from: 'Referred By Doctor')
    fill_in('Age', with: '27')
    select('Female', from: 'Sex')

    click_button('Create Report')

    ["Jon Doe", @doctor.doctor_name, "27", "F", "Edit", "Print"].each do |text|
      expect(page).to have_content(text)
    end

    visit(print_report_path(find('.printLink')['data-report-id']))
    convert_pdf_to_page(page)

    ["Jon Doe", @doctor.name, "27", "F", "ABNORMAL"].each do |text|
      expect(page).to have_content(text)
    end
  end

end
