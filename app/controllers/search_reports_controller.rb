class SearchReportsController < ApplicationController

  before_action :load_reports

  def new
    @search_report = SearchReport.new
    render 'index'
  end

  def index
    @search_report = SearchReport.new(search_reports_params)
    # @reports = @reports.belongs_to_referrer(@search_report.referrer_id)
    # @reports = @reports.date_range(@search_report.date_range)
    # @reports = @reports.patient_name(@search_report.patient_name)
  end

  private
  def search_reports_params
    params.require(:search_report).permit!
  end

  def load_reports
    @reports = Report.recent.includes(:referrer, :patient).paginate(:page => params[:page])
  end
end
