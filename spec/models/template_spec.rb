require 'rails_helper'

RSpec.describe Template, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:ultrasound_type) }
    it { should validate_presence_of(:content) }
  end
end
