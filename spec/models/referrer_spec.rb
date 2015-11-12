require 'rails_helper'

RSpec.describe Referrer, :type => :model do

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  describe 'associations' do
    it { should have_many :reports }
  end

  describe 'scopes' do
    before do
      @first = FactoryGirl.create(:referrer, created_at: 1.day.ago, name: 'A')
      @last  = FactoryGirl.create(:referrer, created_at: 4.day.ago, name: 'B')
    end

    it "should order referrers, recent first" do
      expect(Referrer.recent.to_a).to eq [@first, @last]
    end

    it 'should order referrers by name' do
      expect(Referrer.order_by_name.to_a).to eq [@first, @last]
    end
  end


  it_behaves_like 'versionable', Referrer
end
