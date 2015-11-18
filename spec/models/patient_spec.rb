require 'rails_helper'

RSpec.describe Patient, type: :model do

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_numericality_of(:age).allow_nil }
  end

  describe 'associations' do
    it { should have_many :reports }
  end

end
