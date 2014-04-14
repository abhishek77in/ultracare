class ReportsController < ApplicationController
  def new
    @report = Report.new
    @report.build_patient
    @report.report_type = ReportType.new(reportable: WholeAbdomen.new(WholeAbdomen.params))
  end

  def create
    @report = Report.new(report_params)
    @report.report_type = ReportType.new(reportable: WholeAbdomen.new(report_type_attributes))
    if @report.save && @report.report_type.save
      redirect_to new_reports_path, notice: 'Report Created'
    else
      flash[:alert] = "Sorry! Report could not be created, please fix the errors and try again."
      render 'new'
    end
  end

  def print
    @report = Report.find(params[:id])
    render pdf: 'print', layout: 'pdf.html.haml'
  end

  private
  def report_params
    params.require(:report).permit(:doctor_id, patient_attributes: [:name, :age, :sex])
  end

  def report_type_attributes
    params.require(:report).require(:report_type_attributes).permit!
  end
end
