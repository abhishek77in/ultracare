class ThyroidGland < ActiveRecord::Base
  has_one :report_type, as: :reportable

  def print_template
    'shared/pdf/thyroid_gland'
  end

  def self.params
    Setting.first.default_organ_findings.select { |key, value| column_names.include?(key) }
  end
end
