class ReportType < ActiveRecord::Base
  belongs_to :report
  belongs_to :reportable, polymorphic: true
  accepts_nested_attributes_for :reportable, allow_destroy: true

  validates_presence_of :reportable
end
