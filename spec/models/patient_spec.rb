require 'rails_helper'

RSpec.describe Patient, type: :model do

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_numericality_of(:age).is_greater_than(0).is_less_than(100) }
  end

  describe 'associations' do
    it { should have_many :reports }
  end

  describe 'versioning' do
    it 'enables paper trail' do
      is_expected.to be_versioned
    end

    it 'tracks patient name', :versioning => true do
      patient = FactoryGirl.create(:patient, name: 'A')
      patient.update_attributes!(name: 'B')

      expect(patient.versions.count).to eq 2
      expect(patient.versions.last.reify.name).to eq 'A'
    end
  end
end
