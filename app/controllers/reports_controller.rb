class ReportsController < ApplicationController
  before_action :redirect_to_root, if: -> { setting.disable_reports? }, only: [:index]
  before_action :load_templates, except: [:show, :print]

  def show
    @report = Report.find(params[:id])
  end

  def new
    template = Template.find(params[:template_id])
    @report = Report.new(title: template.report_title,
                         content: template.content)
    @report.build_patient
  end

  def save
    if params[:id].present?
      report = Report.find(params[:id])
    else
      report = Report.new(report_params)
    end
    report.save
    head :ok, content_type: 'text/html'
  end

  def edit
    @report = Report.find(params[:id])
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

  def load_templates
    @templates = Template.all
  end
end
