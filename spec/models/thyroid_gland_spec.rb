require 'rails_helper'

RSpec.describe ThyroidGland, type: :model do

  describe 'associations' do
    it { should have_one(:report_type) }
  end

end
