class Report < ActiveRecord::Base
  has_paper_trail

  belongs_to :doctor
  belongs_to :patient
  accepts_nested_attributes_for :patient

  validates_presence_of :doctor, :patient
  scope :recent, -> { order(updated_at: :desc) }

  after_save :touch

  scope :limit_reports_to_maximum, -> (max_reports) do
    return all unless max_reports
    limit(max_reports)
  end

  scope :belongs_to_doctor, -> (doctor_id) do
    return all unless doctor_id
    where(doctor_id: doctor_id)
  end

  scope :belongs_to_doctors, -> (doctor_ids) do
    return all if doctor_ids.empty?
    where(doctor_id: doctor_ids)
  end

  scope :date_range, -> (date_range) do
    return all unless date_range
    where(created_at: date_range)
  end

  scope :patient_name, -> (patient_name) do
    return all unless patient_name
    includes(:patient).where("patients.name ilike ?", "%#{patient_name}%").references(:patient)
  end

  def possible_genders
    [['Female', 'F'],['Male', 'M']]
  end
end
