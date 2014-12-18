require 'rails_helper'

RSpec.describe Doctor, :type => :model do

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  describe 'associations' do
    it { should have_many :reports }
  end

  describe 'scopes' do
    before do
      @first = FactoryGirl.create(:doctor, created_at: 1.day.ago, name: 'A')
      @last  = FactoryGirl.create(:doctor, created_at: 4.day.ago, name: 'B')
    end

    it "should order doctors, recent first" do
      expect(Doctor.recent.to_a).to eq [@first, @last]
    end

    it 'should order doctors by name' do
      expect(Doctor.order_by_name.to_a).to eq [@first, @last]
    end
  end

  describe 'doctor name' do
    it 'should return formatted doctor name' do
      @first = FactoryGirl.create(:doctor, name: 'A', degree: nil)
      @second  = FactoryGirl.create(:doctor, name: 'B', degree: 'MBBS')
      expect(@first.doctor_name).to eq "A, # #{@first.id}"
      expect(@second.doctor_name).to eq "B (MBBS), # #{@second.id}"
    end
  end

  describe 'history' do
    it 'enables paper trail' do
      is_expected.to be_versioned
    end

    it 'tracks doctor name', :versioning => true do
      doctor = FactoryGirl.create(:doctor, name: 'A')
      doctor.update_attributes!(name: 'B')

      expect(doctor.versions.count).to eq 2
      expect(doctor.versions.last.reify.name).to eq 'A'
    end
  end
end
