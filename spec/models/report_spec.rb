require 'rails_helper'

RSpec.describe Report, :type => :model do

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
  end
end
