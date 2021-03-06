class Report < ActiveRecord::Base
  include PgSearch

  belongs_to :referrer
  belongs_to :patient
  belongs_to :doctor
  accepts_nested_attributes_for :patient

  attr_accessor :referrer_name, :save_status

  module Status
    NEW = :new
    DRAFT = :draft
    SIGNED_OFF = :signed_off
  end

  module SaveStatus
    UNSAVED = :unsaved
    SAVING = :saving
    PENDING = :pending
    SAVED = :saved
    SAVE_FAILED = :save_failed
  end

  before_validation :assign_referrer

  validates_presence_of :patient
  validates_presence_of :referrer, if: :accounting_enabled?
  validates_presence_of :referrer_name, if: :accounting_enabled?

  scope :recent, -> { order(created_at: :desc) }
  scope :drafts, -> { where(status: Report::Status::DRAFT) }

  pg_search_scope :search, :against => [:title, :content]

  scope :limit_reports_to_maximum, -> (max_reports) do
    return all unless max_reports
    limit(max_reports)
  end

  scope :belongs_to_referrer, -> (referrer_id) do
    return all unless referrer_id.present?
    where(referrer_id: referrer_id)
  end

  scope :belongs_to_referrers, -> (referrer_ids) do
    return all if referrer_ids.empty?
    where(referrer_id: referrer_ids)
  end

  scope :date_range, -> (date_range) do
    return all unless date_range.present?
    where(created_at: date_range)
  end

  scope :patient_name, -> (patient_name) do
    return all unless patient_name.present?
    joins(:patient).where("patients.name ilike ?", "%#{patient_name}%").references(:patient)
  end

  scope :patient_id, -> (patient_id) do
    return all unless patient_id.present?
    joins(:patient).where("patients.patient_id ilike ?", "%#{patient_id}%").references(:patient)
  end

  def self.save_from(report_params)
    report_id = report_params[:id]
    if report_id.present?
      report = Report.update_from(report_id, report_params)
    else
      report = Report.create_from(report_params)
    end
    report
  end

  def is_signed_off?
    status == Report::Status::SIGNED_OFF.to_s
  end

  def save_file?
    Gem.win_platform?
  end

  # def on_windows?
  #   RbConfig::CONFIG['target_os'] =~ /mswin|mingw/
  # end

  def file_name
    "#{patient.name}-#{patient.age}yr-#{patient.sex}-#{updated_at.strftime('Signed off at %I-%M%P')}"
  end

  def file_path
    date = created_at.strftime("%d-%m-%Y")
    save_dir_path = Pathname.new('C:/Users/Public/Documents/Ultracare Reports').join(date)
    FileUtils::mkdir_p save_dir_path
    save_path = save_dir_path.join("#{file_name}.pdf")
    save_path
  end

  def assign_referrer
    return if referrer_name.blank?
    self.referrer = Referrer.find_or_create_by(name: referrer_name)
  end

  def possible_genders
    [['Male', Patient::Sex::MALE],
     ['Female', Patient::Sex::FEMALE],
     ['Other', Patient::Sex::OTHER]]
  end

  def accounting_enabled?
    Setting.settings.enable_accounting?
  end

  private

  def self.create_from(report_params)
    report = Report.create(report_params)
    if report.persisted?
      report.save_status = Report::SaveStatus::SAVED
    else
      report.save_status = Report::SaveStatus::SAVE_FAILED
    end
    report
  end

  def self.update_from(report_id, report_params)
    report = self.find(report_id)
    if report.update(report_params)
      report.save_status = Report::SaveStatus::SAVED
    else
      report.save_status = Report::SaveStatus::SAVE_FAILED
    end
    report.reload
  end
end
