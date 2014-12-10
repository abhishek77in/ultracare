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

    it "should return doctors in the correct order" do
      expect(Doctor.recent.to_a).to eq [@first, @last]
    end

    it 'should order doctors by name' do
      expect(Doctor.order_by_name.to_a).to eq [@first, @last]
    end
  end
end
