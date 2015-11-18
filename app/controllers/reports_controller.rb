class ReportsController < ApplicationController
  before_action :redirect_to_root, if: -> { setting.disable_reports? }, only: [:index]

  def show
    @report = Report.find(params[:id])
  end

  def new
    template = Template.find(params[:template_id])
    @report = Report.new(title: template.report_title,
                         content: template.content)
    @report.build_patient
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      flash[:report_id] = @report.id.to_s
      redirect_to root_path, notice: "Report created for #{@report.patient.name}."
    else
      flash.now[:alert] = 'Sorry! Report could not be created, please fix the errors and try again.'
      render 'new'
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
      flash[:report_id] = @report.id.to_s
      redirect_to root_path, notice: "Report updated for #{@report.patient.name}."
    else
      flash.now[:alert] = 'Sorry! Report could not be updated, please fix the errors and try again.'
      render 'edit'
    end
  end

  def print
    @report = Report.find(params[:id])
    render pdf: "#{@report.patient.name} - #{@report.created_at.strftime("%d %b %y")}",
           show_as_html: params[:debug].present?,
           page_size: 'A4',
           layout: 'pdf.html.haml',
           margin: { bottom: setting.footer_margin.to_i,
                     top: setting.header_margin.to_i },
           header: { spacing: setting.header_margin.to_i-2,
                     html: { template: 'shared/pdf/header.pdf.haml', layout: 'layouts/header.pdf.haml' } },
           footer: { html: { template: 'shared/pdf/footer.pdf.haml', layout: 'layouts/footer.pdf.haml' } }
  end

  private

  def report_params
    params.require(:report).permit(:referrer_name,
                                   :doctor_id,
                                   :amount_collected,
                                   :amount_due,
                                   :referrers_discount,
                                   :content,
                                   :title,
                                   patient_attributes: [:name, :age, :sex, :patient_id])
  end
end
