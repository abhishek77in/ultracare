class Report < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient
  accepts_nested_attributes_for :patient
  has_one :report_type
  accepts_nested_attributes_for :report_type, allow_destroy: true

  validates_presence_of :doctor, :patient, :report_type
  scope :recent, -> { order('created_at DESC') }


  def possible_genders
    if for_female?
      [['Female', 'F']]
    elsif for_male?
      [['Male', 'M']]
    else
      [['Female', 'F'],['Male', 'M']]
    end
  end

  private
  def for_male?
    ['Testis','WholeAbdomenMale','KubMale'].include?(report_type.reportable_type)
  end

  def for_female?
    ['Breast','Obstetric','KubFemale','WholeAbdomenFemale','LowerAbdomenFemale'].include?(report_type.reportable_type)
  end

end
