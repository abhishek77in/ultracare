require 'rails_helper'

RSpec.describe ReportsController, type: :controller do

  before do
    FactoryGirl.create(:setting)
    @doctor = FactoryGirl.create(:doctor)
  end

  describe 'GET new' do
    it 'renders report form' do
      get :new, type: 'upper_abdomen'
      expect(response).to be_ok
    end
  end

  describe 'POST create' do
    let(:report_attributes) do
      {"report"=>{"patient_attributes"=>{"name"=>"Mrs. Gerardo Lesch", "age"=>"45", "sex"=>"F"},
                  "doctor_id"=> @doctor.id,
                  "report_type_attributes"=>{"thyroid_left_lobe"=>"Appears NORMAL in size, shape & echotexture. No focal lesion seen.",
                                             "thyroid_right_lobe"=>"Appears NORMAL in size, shape & echotexture. No focal lesion seen.",
                                             "i_j_v_and_c_a"=>"NORMAL", "isthmus"=>"NORMAL", "other"=>"",
                                             "impression"=>"ORGANS ARE UNDER SCAN WITHIN NORMAL LIMITS.", "advise"=>""}
                 },
       "type"=>"thyroid_gland"}
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
      get :edit, {id: report.id, type: report.report_type}
      expect(response).to be_ok
      expect(response).to render_template(:edit)
    end
  end

  describe 'Patch update' do
    it 'updates the report' do
      report = FactoryGirl.create(:report)
      report_attributes = {"report"=>{"report_type_attributes"=>{"thyroid_left_lobe"=>"Appears NORMAL"}}, "type"=>report.report_type.reportable_type.underscore}
      put :update, report_attributes.merge(id: report.id)
      expect(response).to redirect_to(root_path)
    end
  end
end
