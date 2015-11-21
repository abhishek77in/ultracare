class ReportsController < ApplicationController
  before_action :redirect_to_root, if: -> { setting.disable_reports? }, only: [:index]
  before_action :load_templates, except: [:show, :print]

  def show
    @report = Report.find(params[:id])
  end

  def new
    template = Template.find(params[:template_id])
    @report = Report.new(title: template.report_title,
                         status: 'new',
                         content: template.content)
    @report.build_patient
  end

  def save
    if report_id.present?
      report = update(report_id)
    else
      report = create
    end
    render json: report
  end

  def edit
    @report = Report.find(params[:id])
  end

  def print
    @report = Report.find(params[:id])
    file_name = "#{@report.patient.name} - #{@report.created_at.strftime('%d %b %y')}"
    file_path = path_to_save_file(file_name)
    if file_path.present?
      render({save_to_file: file_path}.merge(pdf_options(file_name)))
    else
      render pdf_options(file_name)
    end
  end

  private
  def path_to_save_file(file_name)
    Rails.root.join('public', "#{file_name}.pdf")
  end

  def create
    create_params = report_params.merge(status: 'draft')
    Report.create(create_params)
  end

  def update(report_id)
    update_params = report_params.merge(status: 'draft')
    report = Report.find(report_id)
    report.update(update_params)
    report.reload
  end

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

  def pdf_options(file_name)
    { pdf: file_name,
      show_as_html: params[:debug].present?,
      page_size: 'A4',
      layout: 'pdf.html.haml',
      margin: { bottom: setting.footer_margin.to_i,
                top: setting.header_margin.to_i },
      header: { spacing: setting.header_margin.to_i-2,
                html: { template: 'shared/pdf/header.pdf.haml',
                        layout: 'layouts/header.pdf.haml' } },
      footer: { html: { template: 'shared/pdf/footer.pdf.haml',
                        layout: 'layouts/footer.pdf.haml' } } }
  end

  def report_id
    params[:report][:id]
  end

  def load_templates
    @templates = Template.all
  end
end
