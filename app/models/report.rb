class Report < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient
  accepts_nested_attributes_for :patient
  has_one :report_type
  accepts_nested_attributes_for :report_type, allow_destroy: true

  validates_presence_of :doctor, :patient, :report_type
end
