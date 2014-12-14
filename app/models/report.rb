class Report < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient
  accepts_nested_attributes_for :patient
  has_one :report_type
  accepts_nested_attributes_for :report_type, allow_destroy: true

  validates_presence_of :doctor, :patient, :report_type
  scope :recent, -> { order('reports.created_at DESC') }
  scope :belongs_to_doctor, -> (doctor_id) { where(doctor_id: doctor_id) }
  scope :belongs_to_doctors, -> (doctor_ids) { where(doctor_id: doctor_ids) }
  scope :date_range, -> (date_range) { where(created_at: date_range) }
  scope :patient_name, -> (patient_name) { includes(:patient).where("patients.name ilike ?", "%#{patient_name}%").references(:patient) }

  after_save :touch

  def possible_genders
    if for_female?
      [['Female', 'F']]
    elsif for_male?
      [['Male', 'M']]
    else
      [['Female', 'F'],['Male', 'M']]
    end
  end

  def reportable_type
    report_type.reportable_type
  end

  private
  def for_male?
    ['Testis','WholeAbdomenMale','KubMale'].include?(report_type.reportable_type)
  end

  def for_female?
    ['Breast','Obstetric','KubFemale','WholeAbdomenFemale','LowerAbdomenFemale'].include?(report_type.reportable_type)
  end

end
