class HomeController < ApplicationController
  layout 'homepage'

  def index
    @reports = Report.recent
    @reports = @reports.belongs_to_doctor(doctor_id_param) if params[:search] && doctor_id_param.present?
    @reports = @reports.date_range(date_range_param) if params[:search] && date_range_param.present?

    if params[:print_business_report]
      render pdf: "Business Report - #{Time.now.strftime("%d %b %y")}",
             template: 'home/print_business_report.html.haml',
             layout: 'business_report_pdf.html.haml',
             margin: { bottom: 5, top: 5 }
    else
      @reports = @reports.paginate(:page => params[:page])
      render 'index'
    end
  end

  private
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
