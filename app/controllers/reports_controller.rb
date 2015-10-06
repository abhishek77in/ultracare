class ReportsController < ApplicationController
  before_action :redirect_to_root, if: -> { setting.disable_reports? }, only: [:index]

  def index
    @reports = Report.recent
    @reports = @reports.belongs_to_doctor(doctor_id_param) if params[:search] && doctor_id_param.present?
    @reports = @reports.date_range(date_range_param) if params[:search] && date_range_param.present?
    @reports = @reports.patient_name(params[:search][:patient_name]) if params[:search]
    @reports = @reports.includes(:doctor, :patient, :report_type).paginate(:page => params[:page])
    @reports = @reports.date_range(setting.show_reports_from_last_days.days.ago..Date.tomorrow) if setting.show_reports_from_last_days?
    @reports = @reports.limit_reports_to_maximum(setting.show_max_reports)
  end

  def new
    @report = Report.new
    @report.build_patient
    @reportable = new_reportable
    @report.report_type = ReportType.new(reportable: @reportable)
  end

  def create
    @report = Report.new(report_params)
    @reportable = reportable
    @report.report_type = ReportType.new(reportable: @reportable)
    if @report.save
      flash[:report_id] = @report.id.to_s
      redirect_to root_path, notice: 'Report Created'
    else
      flash.now[:alert] = "Sorry! Report could not be created, please fix the errors and try again."
      render 'new'
    end
  end

  def edit
    @report = Report.find(params[:id])
    @reportable = @report.report_type.reportable
  end

  def update
    @report = Report.find(params[:id])
    @report.cost = report_params[:cost]
    @reportable = @report.report_type.reportable
    @reportable.attributes = report_type_attributes
    if @report.save
      flash[:report_id] = @report.id.to_s
      redirect_to root_path, notice: "Report Updated for #{@report.patient.name}."
    else
      flash.now[:alert] = "Sorry! Report could not be updated, please fix the errors and try again."
      render 'edit'
    end
  end

  def print
    @setting = Setting.first
    @report = Report.find(params[:id])
    @reportable = @report.report_type.reportable
    render pdf: "#{@report.patient.name} - #{@report.created_at.strftime("%d %b %y")}",
           show_as_html: params[:debug].present?,
           page_size: 'A4',
           layout: 'pdf.html.haml',
           margin: { bottom: 20, top: 65 },
           header: { spacing: 63, html: { template: 'shared/pdf/header.pdf.haml', layout: 'layouts/header.pdf.haml' } },
           footer: { html: { template: 'shared/pdf/footer.pdf.haml', layout: 'layouts/footer.pdf.haml' } }
  end

  private
  def new_reportable
    model_name = params['type'].titlecase.delete(' ')
    model = Object.const_get model_name
    model.new(model.params)
  end

  def reportable
    model_name = params['type'].titlecase.delete(' ')
    model = Object.const_get model_name
    model.new(report_type_attributes)
  end

  def report_params
    params.require(:report).permit(:doctor_id, :cost, patient_attributes: [:name, :age, :sex])
  end

  def report_type_attributes
    params.require(:report).require(:report_type_attributes).permit!
  end

  def doctor_id_param
    params.require(:search).permit(:doctor_id)[:doctor_id]
  end

  def date_range_param
    date_range = params.require(:search).permit(:date_range)[:date_range]
    return if date_range.blank?
    date_range = date_range.split(' to ')
    start_date = to_date(date_range.first)
    end_date = to_date(date_range.last) + 1
    start_date..end_date
  end

  def to_date(date_string)
    Date.strptime(date_string, '%d-%m-%Y')
  end
end
