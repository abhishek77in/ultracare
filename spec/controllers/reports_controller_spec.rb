require 'rails_helper'

RSpec.describe ReportsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  before do
    FactoryGirl.create(:setting)
    @template = FactoryGirl.create(:template)
    @referrer = FactoryGirl.create(:referrer)
    sign_in user
  end

  describe 'GET new' do
    it 'renders report form' do
      get :new, template_id: @template.id
      expect(response).to be_ok
    end
  end

  describe 'Get edit' do
    it 'loads reports to be edited' do
      report = FactoryGirl.create(:report)
      get :edit, {id: report.id}
      expect(response).to be_ok
      expect(response).to render_template(:edit)
    end
  end

  describe 'Get print' do
    it 'renders pdf report to be printed' do
      report = FactoryGirl.create(:report, status: Report::Status::SIGNED_OFF)
      get :print, {id: report.id}
      expect(response).to render_template(:print)
    end
  end
end
