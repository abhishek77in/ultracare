require 'rails_helper'

RSpec.describe Report, :type => :model do

  describe 'validations' do
    # it { should validate_presence_of(:referrer) }
    it { should validate_presence_of(:patient) }
  end

  describe 'associations' do
    it { should belong_to(:referrer) }
    it { should belong_to(:patient) }
  end

  describe 'nested attributes' do
    it { should accept_nested_attributes_for(:patient) }
  end

  describe 'search' do
    it 'should search for reports containing text within title' do
      report = FactoryGirl.create(:report, title: 'alfa beta')
      expect(Report.search('beta')).to eq [report]
    end
    
    it 'should search for reports containing text within title and content' do
      first = FactoryGirl.create(:report, title: 'alfa beta')
      second = FactoryGirl.create(:report, title: 'alfa', content: 'beta')
      expect(Report.search('beta')).to eq [first, second]
    end
  end

  describe 'scopes' do

    it 'should return recent reports as per created_at timestamp' do
      first = FactoryGirl.create(:report)
      second = FactoryGirl.create(:report)
      expect(Report.recent.to_a).to eq [second, first]
    end

    it 'should return reports from given referrer' do
      referrer1 = FactoryGirl.create(:referrer)
      referrer2 = FactoryGirl.create(:referrer)
      report1 = FactoryGirl.create(:report, referrer_name: referrer1.name)
      FactoryGirl.create(:report, referrer: referrer2)
      expect(Report.belongs_to_referrer(referrer1.id).to_a).to eq [report1]
      expect(Report.belongs_to_referrer(nil)).to eq Report.all
    end

    it 'should return reports from given set of referrers' do
      referrer1 = FactoryGirl.create(:referrer)
      referrer2 = FactoryGirl.create(:referrer)
      report1 = FactoryGirl.create(:report, referrer_name: referrer1.name)
      report2 = FactoryGirl.create(:report, referrer_name: referrer2.name)
      expect(Report.belongs_to_referrers([referrer1.id, referrer2.id]).to_a).to eq [report1, report2]
      expect(Report.belongs_to_referrers([])).to eq Report.all
    end

    it 'should return reports in given date range'

    it 'should return matched reports for given patient name' do
      report = FactoryGirl.create(:report, patient: FactoryGirl.create(:patient, name: 'jon doe'))
      expect(Report.patient_name('jon')).to contain_exactly report
      expect(Report.patient_name('doe')).to contain_exactly report
      expect(Report.patient_name('on do')).to contain_exactly report
      expect(Report.patient_name(nil)).to eq Report.all
    end
  end
end
