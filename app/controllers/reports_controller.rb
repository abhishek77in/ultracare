class ReportsController < ApplicationController
  def new
    @report = Report.new
    @report.build_patient
    @reportable = new_reportable
    @report.report_type = ReportType.new(reportable: @reportable)
  end

  def create
    @report = Report.new(report_params)
    @reportable = reportable
    @report.report_type = ReportType.new(reportable: @reportable)
    if @report.save
      flash[:report_id] = @report.id.to_s
      redirect_to root_path, notice: 'Report Created'
    else
      flash.now[:alert] = "Sorry! Report could not be created, please fix the errors and try again."
      render 'new'
    end
  end

  def edit
    @report = Report.find(params[:id])
    @reportable = @report.report_type.reportable
  end

  def update
    @report = Report.find(params[:id])
    @report.attributes = report_params
    @reportable = @report.report_type.reportable
    @reportable.attributes = report_type_attributes
    if @report.save
      flash[:report_id] = @report.id.to_s
      redirect_to root_path, notice: "Report Updated for #{@report.patient.name}."
    else
      flash.now[:alert] = "Sorry! Report could not be updated, please fix the errors and try again."
      render 'edit'
    end
  end

  def print
    @setting = Setting.first
    @report = Report.find(params[:id])
    @reportable = @report.report_type.reportable
    render pdf: "#{@report.patient.name} - #{@report.created_at.strftime("%d %b %y")}",
           show_as_html: params[:debug].present?,
           page_size: 'A4',
           layout: 'pdf.html.haml',
           margin: { bottom: 20, top: 1 },
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
