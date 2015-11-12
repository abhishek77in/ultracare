class BusinessReportsController < ApplicationController
  before_action :redirect_to_root, unless: -> { setting.enable_accounting? }

  def new
    @business_report = BusinessReport.new
  end

  def print
    @business_report = BusinessReport.new(business_report_params)

    if @business_report.valid?
      @reports = Report.order('doctors.name, reports.created_at')
      @reports = @reports.belongs_to_doctors(@business_report.doctor_ids)
      @reports = @reports.date_range(@business_report.date_range).includes(:doctor, :patient, :report_type)

      render pdf: @business_report.file_name,
             layout: 'business_report_pdf.html.haml',
             margin: { bottom: 5, top: 5 }
    else
      render 'new'
    end
  end

  private
  def business_report_params
    params.require(:business_report).permit!
  end

end
