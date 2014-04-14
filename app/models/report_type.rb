class ReportType < ActiveRecord::Base
  belongs_to :report
  belongs_to :reportable, polymorphic: true
  accepts_nested_attributes_for :reportable, allow_destroy: true

  validates_presence_of :reportable

  def report_type_fields
    self.reportable.attributes.keys - %w(id created_at updated_at)
  end
end
