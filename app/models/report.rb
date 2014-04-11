class Report < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient
  has_one :report_type
end
