class Obstetric < ActiveRecord::Base
  has_one :report_type, as: :reportable

  def print_template
    'shared/pdf/obstetric'
  end

  def self.params
    Setting.first.default_obstetric_findings
  end
end
