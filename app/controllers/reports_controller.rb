class ReportsController < ApplicationController
  def new
    @report = Report.new
    @report.report_type = ReportType.new(reportable: WholeAbdomen.new)
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      redirect_to '/', notice: 'Report Created'
    else
      render 'new'
    end
  end

  private
  def report_params
    params.require(:report).permit(:doctor_id, patient_attributes: [:first_name, :last_name, :title, :age, :sex])
  end
end
