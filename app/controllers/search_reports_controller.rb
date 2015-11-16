class SearchReportsController < ApplicationController

  def index
    # @reports = SearchReport.new(search_reports_params)
    @reports = Report.recent
    # @reports = @reports.belongs_to_referrer(referrer_id_param) if params[:search] && referrer_id_param.present?
    # @reports = @reports.date_range(date_range_param) if params[:search] && date_range_param.present?
    # @reports = @reports.patient_name(params[:search][:patient_name]) if params[:search]
    @reports = @reports.includes(:referrer, :patient).paginate(:page => params[:page])
    # @reports = @reports.date_range(setting.show_reports_from_last_days.days.ago..Date.tomorrow) if setting.show_reports_from_last_days?
    # @reports = @reports.limit_reports_to_maximum(setting.show_max_reports)
  end

  private
  def search_reports_params
    params.require(:search_reports).permit!
  end
end
