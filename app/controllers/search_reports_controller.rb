class SearchReportsController < ApplicationController

  before_action :load_reports

  def new
    @search_report = SearchReport.new
    @reports = @reports.decorate
    render 'index'
  end

  def index
    @search_report = SearchReport.new(search_reports_params)
    @reports = @reports.search(@search_report.keyword) if @search_report.keyword.present?
    @reports = @reports.belongs_to_referrer(@search_report.referrer_id)
    @reports = @reports.date_range(@search_report.converted_date_range)
    @reports = @reports.patient_name(@search_report.patient_name)
    @reports = @reports.patient_id(@search_report.patient_id)
    @reports = @reports.decorate
  end

  private
  def search_reports_params
    params.require(:search_report).permit!
  end

  def load_reports
    @reports = Report.recent.paginate(:page => params[:page])
  end
end
