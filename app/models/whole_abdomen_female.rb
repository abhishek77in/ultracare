class WholeAbdomenFemale < ActiveRecord::Base
  has_one :report_type, as: :reportable

  def self.params
    Setting.first.default_organ_findings.select { |key, value| column_names.include?(key) }
  end
end
