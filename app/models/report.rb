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
  end

  before_validation :assign_referrer

  validates_presence_of :patient
  # validates_presence_of :referrer, :referrer_name
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
      report = self.find(report_id)
      report.update(report_params)
      report.reload
    else
      report = Report.create(report_params)
    end
    report
  end

  def is_signed_off?
    status == Report::Status::SIGNED_OFF.to_s
  end

  def save_file?
    Gem.win_platform?
  end

  def file_name
    "#{self.patient.name} - #{self.created_at.strftime('%d %b %y')}"
  end

  def file_path
    FileUtils::mkdir_p Pathname.new(Dir.home).join('Documents').join('Ultracare')
    Pathname.new(Dir.home).join('Documents').join('Ultracare').join("#{file_name}.pdf")
  end

  def assign_referrer
    return if referrer_name.blank?
    self.referrer = Referrer.find_or_create_by(name: referrer_name)
  end

  def save_status
    if self.persisted?
      Report::SaveStatus::SAVED
    else
      Report::SaveStatus::UNSAVED
    end
  end

  def possible_genders
    [['Male', Patient::Sex::MALE],
     ['Female', Patient::Sex::FEMALE],
     ['Other', Patient::Sex::OTHER]]
  end
end
