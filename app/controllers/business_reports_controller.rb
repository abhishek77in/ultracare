class BusinessReportsController < ApplicationController

  def new
    @buisness_report = BusinessReport.new
  end

  def print
    @reports = Report.order('doctors.name, reports.created_at')
    @reports = @reports.belongs_to_doctors(doctor_ids_param) if params[:search] && doctor_ids_param.present?

    if date_range_param.blank?
      flash.now[:alert] = "Please specify Date Range to Print Business Report."
      render 'business_report'
    elsif (date_range_param.max - date_range_param.min).to_i > 90
      flash.now[:alert] = "Sorry! Cannot print business report for more than 90 days period."
      render 'business_report'
    else
      @reports = @reports.date_range(date_range_param).includes(:doctor, :patient, :report_type)
      render pdf: "Business Report - #{Time.now.strftime("%d %b %y")}",
             layout: 'business_report_pdf.html.haml',
             margin: { bottom: 5, top: 5 }
    end
  end

  private
  def doctor_id_param
    params.require(:search).permit(:doctor_id)[:doctor_id]
  end

  def doctor_ids_param
    params.require(:search).permit![:doctor_id].reject(&:blank?)
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
