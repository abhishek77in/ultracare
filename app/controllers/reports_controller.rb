class ReportsController < ApplicationController
  def new
    @report = Report.new
    @report.build_patient
    @report.report_type = ReportType.new(reportable: new_reportable)
  end

  def create
    @report = Report.new(report_params)
    @report.report_type = ReportType.new(reportable: reportable)
    if @report.save && @report.report_type.save
      redirect_to root_path, notice: 'Report Created'
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
    @report.report_type.reportable.attributes = report_type_attributes
    if @report.save
      redirect_to root_path, notice: 'Report Updated'
    else
      flash.now[:alert] = "Sorry! Report could not be updated, please fix the errors and try again."
      render 'edit'
    end
  end

  def print
    @report = Report.find(params[:format])
    @reportable = @report.report_type.reportable
    render pdf: "#{@report.patient.name} - #{@report.created_at.strftime("%d %b %y")}",
           layout: 'pdf.html.haml',
           margin: { bottom: 30 },
           footer: { html: { template: 'shared/pdf/footer.pdf.haml', layout: 'layouts/footer.pdf.haml' } }
  end

  private
  def new_reportable
    model_name = params['type'].titlecase.delete(' ')
    model = Object.const_get model_name
    model.new(model.params)
  end

  def reportable
    model_name = params['type'].titlecase.delete(' ')
    model = Object.const_get model_name
    model.new(report_type_attributes)
  end

  def report_params
    params.require(:report).permit(:doctor_id, patient_attributes: [:name, :age, :sex])
  end

  def report_type_attributes
    params.require(:report).require(:report_type_attributes).permit!
  end
end
