require 'rails_helper'

RSpec.describe Doctor, :type => :model do

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end

  describe 'associations' do
    it { should have_many :reports }
  end
end
