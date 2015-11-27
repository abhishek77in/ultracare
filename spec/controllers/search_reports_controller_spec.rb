require 'rails_helper'

RSpec.describe SearchReportsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  before do
    sign_in user
  end

  describe 'GET new' do
    it 'renders new report search form' do
      get :new
      expect(response).to be_ok
    end
  end
end
