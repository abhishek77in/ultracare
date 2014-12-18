require 'rails_helper'

RSpec.describe ThyroidGland, type: :model do

  it_behaves_like 'versionable', ThyroidGland

  describe 'associations' do
    it { should have_one(:report_type) }
  end

end
