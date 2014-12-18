require 'rails_helper'

RSpec.describe Report, :type => :model do

  it_behaves_like 'versionable', Report

  describe 'validations' do
    it { should validate_presence_of(:doctor) }
    it { should validate_presence_of(:patient) }
    it { should validate_presence_of(:report_type) }
  end

  describe 'associations' do
    it { should belong_to(:doctor) }
    it { should belong_to(:patient) }
    it { should have_one(:report_type) }
  end

  describe 'nested attributes' do
    it { should accept_nested_attributes_for(:patient) }
    it { should accept_nested_attributes_for(:report_type) }
  end

  describe 'callbacks' do
    it 'should update updated_at timestamp when called upon by save' do
      report = FactoryGirl.create(:report)
      expect{report.save}.to change {report.updated_at}
    end
  end

  describe 'scopes' do

    it 'should return recent reports as per updated_at timestamp' do
      first = FactoryGirl.create(:report)
      second = FactoryGirl.create(:report)
      first.touch
      expect(Report.recent).to eq [first, second]
    end

    it 'should return reports from given doctor' do
      doctor1 = FactoryGirl.create(:doctor)
      doctor2 = FactoryGirl.create(:doctor)
      report1 = FactoryGirl.create(:report, doctor: doctor1)
      FactoryGirl.create(:report, doctor: doctor2)
      expect(Report.belongs_to_doctor(doctor1.id)).to eq [report1]
    end

    it 'should return reports from given set of doctors' do
      doctor1 = FactoryGirl.create(:doctor)
      doctor2 = FactoryGirl.create(:doctor)
      report1 = FactoryGirl.create(:report, doctor: doctor1)
      report2 = FactoryGirl.create(:report, doctor: doctor2)
      expect(Report.belongs_to_doctor([doctor1.id, doctor2.id])).to eq [report1, report2]
    end

    it 'should return reports in given date range'

    it 'should return matched reports for given patient name' do
      report = FactoryGirl.create(:report, patient: FactoryGirl.create(:patient, name: 'jon doe'))
      expect(Report.patient_name('jon')).to contain_exactly report
      expect(Report.patient_name('doe')).to contain_exactly report
      expect(Report.patient_name('on do')).to contain_exactly report
    end
  end
end
