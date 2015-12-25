class ReportsController < ApplicationController
  before_action :redirect_to_root, if: -> { setting.disable_reports? }, only: [:index]
  before_action :load_templates, except: [:show, :print]

  def show
    @report = Report.find(params[:id]).decorate
  end

  def new
    template = Template.find(params[:template_id])
    @report = Report.new(title: template.report_title,
                         status: Report::Status::NEW,
                         content: template.content)
    @report.build_patient
  end

  def save
    report = Report.save_from(report_params)
    render json: report.decorate
  end

  def edit
    @report = Report.find(params[:id])
  end

  def print
    @report = Report.find(params[:id]).decorate
    if @report.is_signed_off?
      if @report.save_file?
        render({save_to_file: @report.file_path}.merge(pdf_options(@report.file_name)))
      else
        render pdf_options(@report.file_name)
      end
    else
      redirect_to root_path, alert: 'Please sign off report before printing.'
    end
  end

  private

  def report_params
    params.require(:report).permit(:id,
                                   :doctor_id,
                                   :referrer_name,
                                   :amount_collected,
                                   :amount_due,
                                   :referrers_discount,
                                   :content,
                                   :title,
                                   :status,
                                   patient_attributes: [:id, :name, :age, :sex, :patient_id])
  end

  def pdf_options(file_name)
    { pdf: file_name,
      show_as_html: params[:debug].present?,
      page_size: 'A4',
      layout: 'pdf.html.haml',
      margin: { bottom: setting.footer_margin.to_i,
                top: setting.header_margin.to_i },
      header: { spacing: setting.header_margin.to_i - 5,
                right: 'Page [page] of [topage]',
                html: { template: 'shared/pdf/header.pdf.haml',
                        layout: 'layouts/header.pdf.haml' } },
      footer: { html: { template: 'shared/pdf/footer.pdf.haml',
                        layout: 'layouts/footer.pdf.haml' } } }
  end

  def load_templates
    @templates = Template.all
  end
end
