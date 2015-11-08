require 'rails_helper'

RSpec.describe ReportsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  before do
    FactoryGirl.create(:setting)
    @template = FactoryGirl.create(:template)
    @doctor = FactoryGirl.create(:doctor)
    sign_in user
  end

  describe 'GET new' do
    it 'renders report form' do
      get :new, template_id: @template.id
      expect(response).to be_ok
    end
  end

  describe 'POST create' do
    let(:report_attributes) do
      { "report"=>{"patient_attributes"=>{"name"=>"Mrs. Gerardo Lesch", "age"=>"45", "sex"=>"F"},
                  "doctor_id"=> @doctor.id
                 }
      }
    end

    it 'creates report on valid post' do
      expect{ post :create, report_attributes }.to change { Report.count }.by(1)
      expect(response).to redirect_to(root_path)
    end

    it 'does not create report on invalid post' do
      report_attributes['report']['doctor_id'] = ''
      expect{ post :create, report_attributes }.to change { Report.count }.by(0)
      expect(response).to render_template(:new)
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

  describe 'Patch update' do
    it 'updates the report' do
      report = FactoryGirl.create(:report)
      report_attributes = {report: { content: 'hello world' }}
      patch :update, report_attributes.merge(id: report.id)
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'Get print' do
    it 'renders pdf report to be printed' do
      report = FactoryGirl.create(:report)
      get :print, {id: report.id}
      expect(response).to render_template(:print)
    end
  end
end
