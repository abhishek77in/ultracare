class HomeController < ApplicationController

  def index
    @reports = Report.recent
    @reports = @reports.belongs_to_doctor(doctor_id_param) if params[:search] && doctor_id_param.present?
    @reports = @reports.date_range(date_range_param) if params[:search] && date_range_param.present?
    @reports = @reports.patient_name(params[:search][:patient_name]) if params[:search]
    @reports = @reports.includes(:doctor, :patient, :report_type).paginate(:page => params[:page])
  end

  def print_business_report
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

  def business_analysis
    @reports = Report.date_range(date_range_param)

    @pie_chart_data = Hash.new
    @reports.includes(:doctor).group_by(&:doctor).each do |doctor, reports|
      @pie_chart_data.merge!({"Dr. #{doctor.name}" => reports.length})
    end

    @line_chart_data = @reports.group_by_day(:created_at).count
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
