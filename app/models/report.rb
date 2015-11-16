class Report < ActiveRecord::Base
  belongs_to :referrer
  belongs_to :patient
  belongs_to :doctor
  accepts_nested_attributes_for :patient

  attr_accessor :referrer_name

  before_validation :assign_referrer

  validates_presence_of :referrer, :patient
  scope :recent, -> { order(created_at: :desc) }

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
    includes(:patient).where("patients.name ilike ?", "%#{patient_name}%").references(:patient)
  end

  scope :patient_id, -> (patient_id) do
    return all unless patient_id.present?
    includes(:patient).where("patients.patient_id ilike ?", "%#{patient_id}%").references(:patient)
  end

  def assign_referrer
    return if referrer_name.blank?
    self.referrer = Referrer.find_or_create_by(name: referrer_name)
  end

  def possible_genders
    [['Female', 'F'],['Male', 'M']]
  end
end
