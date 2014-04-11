class ReportType < ActiveRecord::Base
  belongs_to :report
  belongs_to :reportable, polymorphic: true
end
