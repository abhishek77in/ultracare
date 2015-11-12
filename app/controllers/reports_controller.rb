class ReportsController < ApplicationController
  before_action :redirect_to_root, if: -> { setting.disable_reports? }, only: [:index]
  before_action :load_template, only: [:new]

  def show
    @report = Report.find(params[:id])
  end

  def index
    @reports = Report.recent
    @reports = @reports.belongs_to_referrer(referrer_id_param) if params[:search] && referrer_id_param.present?
    @reports = @reports.date_range(date_range_param) if params[:search] && date_range_param.present?
    @reports = @reports.patient_name(params[:search][:patient_name]) if params[:search]
    @reports = @reports.includes(:referrer, :patient).paginate(:page => params[:page])
    @reports = @reports.date_range(setting.show_reports_from_last_days.days.ago..Date.tomorrow) if setting.show_reports_from_last_days?
    @reports = @reports.limit_reports_to_maximum(setting.show_max_reports)
  end

  def new
    @report = Report.new
    @report.content = @template.content
    @report.title = @template.report_title
    @report.build_patient
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      flash[:report_id] = @report.id.to_s
      redirect_to root_path, notice: "Report created for #{@report.patient.name}."
    else
      flash.now[:alert] = "Sorry! Report could not be created, please fix the errors and try again."
      render 'new'
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
      flash[:report_id] = @report.id.to_s
      redirect_to root_path, notice: "Report updated for #{@report.patient.name}."
    else
      flash.now[:alert] = "Sorry! Report could not be updated, please fix the errors and try again."
      render 'edit'
    end
  end

  def print
    @report = Report.find(params[:id])
    render pdf: "#{@report.patient.name} - #{@report.created_at.strftime("%d %b %y")}",
           show_as_html: params[:debug].present?,
           page_size: 'A4',
           layout: 'pdf.html.haml',
           margin: { bottom: setting.footer_margin.to_i, top: setting.header_margin.to_i },
           header: { spacing: setting.header_margin.to_i-2, html: { template: 'shared/pdf/header.pdf.haml', layout: 'layouts/header.pdf.haml' } },
           footer: { html: { template: 'shared/pdf/footer.pdf.haml', layout: 'layouts/footer.pdf.haml' } }
  end

  private

  def report_params
    params.require(:report).permit(:referrer_id, :amount_collected, :amount_due, :referrers_discount, :content, :title, patient_attributes: [:name, :age, :sex, :patient_id])
  end

  def referrer_id_param
    params.require(:search).permit(:referrer_id)[:referrer_id]
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

  def load_template
    @template = Template.find(params[:template_id])
  end
end
