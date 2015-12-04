require 'rails_helper'

RSpec.describe Report, :type => :model do
  before(:all) do
    FactoryGirl.create(:setting)
  end

  describe 'validations' do
    it { should validate_presence_of(:patient) }

    context 'if accounting enabled' do
      before { allow(subject).to receive(:accounting_enabled?).and_return(true) }
      it { should validate_presence_of(:referrer) }
      it { should validate_presence_of(:referrer_name) }
    end

    context 'if  accounting disabled' do
      before { allow(subject).to receive(:accounting_enabled?).and_return(false) }
      it { should_not validate_presence_of(:referrer) }
      it { should_not validate_presence_of(:referrer_name) }
    end
  end

  describe 'associations' do
    it { should belong_to(:referrer) }
    it { should belong_to(:patient) }
  end

  describe 'nested attributes' do
    it { should accept_nested_attributes_for(:patient) }
  end

  describe 'search' do
    it 'should search for reports containing text within title' do
      report = FactoryGirl.create(:report, title: 'alfa beta')
      expect(Report.search('beta')).to eq [report]
    end
    
    it 'should search for reports containing text within title and content' do
      first = FactoryGirl.create(:report, title: 'alfa beta')
      second = FactoryGirl.create(:report, title: 'alfa', content: 'beta')
      expect(Report.search('beta')).to eq [first, second]
    end
  end

  describe 'scopes' do

    it 'should return recent reports as per created_at timestamp' do
      first = FactoryGirl.create(:report)
      second = FactoryGirl.create(:report)
      expect(Report.recent.to_a).to eq [second, first]
    end

    it 'should return reports from given referrer' do
      referrer1 = FactoryGirl.create(:referrer)
      referrer2 = FactoryGirl.create(:referrer)
      report1 = FactoryGirl.create(:report, referrer_name: referrer1.name)
      FactoryGirl.create(:report, referrer: referrer2)
      expect(Report.belongs_to_referrer(referrer1.id).to_a).to eq [report1]
      expect(Report.belongs_to_referrer(nil)).to eq Report.all
    end

    it 'should return reports from given set of referrers' do
      referrer1 = FactoryGirl.create(:referrer)
      referrer2 = FactoryGirl.create(:referrer)
      report1 = FactoryGirl.create(:report, referrer_name: referrer1.name)
      report2 = FactoryGirl.create(:report, referrer_name: referrer2.name)
      expect(Report.belongs_to_referrers([referrer1.id, referrer2.id]).to_a).to eq [report1, report2]
      expect(Report.belongs_to_referrers([])).to eq Report.all
    end

    it 'should return reports in given date range'

    it 'should return matched reports for given patient name' do
      report = FactoryGirl.create(:report, patient: FactoryGirl.create(:patient, name: 'jon doe'))
      expect(Report.patient_name('jon')).to contain_exactly report
      expect(Report.patient_name('doe')).to contain_exactly report
      expect(Report.patient_name('on do')).to contain_exactly report
      expect(Report.patient_name(nil)).to eq Report.all
    end
  end

  describe 'save from' do
    let(:report_params) { FactoryGirl.attributes_for(:report)
                            .merge(patient_attributes: FactoryGirl.attributes_for(:patient)) }

    it 'should create a new report' do
      expect{ Report.save_from(report_params) }.to change{ Report.count }.by(1)
    end

    it 'should update an existing report' do
      report = FactoryGirl.create(:report, title: 'title one')
      report_update_params = report_params.merge(id: report.id, title: 'title two')
      expect{ Report.save_from(report_update_params)}.to_not change{ Report.count }
      updated_report = report.reload
      expect(updated_report.title).to eq report_update_params[:title]
    end

    it 'should update an existing report without creating new patient record' do
      report = FactoryGirl.create(:report)
      old_patient = report.patient
      report_update_params = report_params.merge(id: report.id,
                                                 patient_attributes: { id: old_patient.id })
      Report.save_from(report_update_params)
      updated_report = report.reload
      expect(old_patient.id).to eq updated_report.patient.id
    end

    it 'should set save status to :saved after report is created' do
      report = Report.save_from(report_params)
      expect(report.save_status).to eq Report::SaveStatus::SAVED
    end

    it 'should set save status to :save_failed if report creation fails' do
      invalid_report_params = report_params.merge(patient_attributes: { name: '' })
      report = Report.save_from(invalid_report_params)
      expect(report.save_status).to eq Report::SaveStatus::SAVE_FAILED
    end

    it 'should set save status to :saved after report is updated' do
      report = FactoryGirl.create(:report)
      report_update_params = report_params.merge(id: report.id)
      report = Report.save_from(report_update_params)
      expect(report.save_status).to eq Report::SaveStatus::SAVED
    end

    it 'should set save status to :save_failed if report update fails' do
      report = FactoryGirl.create(:report)
      invalid_report_update_params = report_params.merge(id: report.id, patient_attributes: { name: '' })
      report = Report.save_from(invalid_report_update_params)
      expect(report.save_status).to eq Report::SaveStatus::SAVE_FAILED
    end
  end
end
