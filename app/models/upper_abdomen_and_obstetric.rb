class UpperAbdomenAndObstetric < ActiveRecord::Base
  include Reportable

  def self.params
    Setting.first.default_organ_findings.select { |key, value| column_names.include?(key) }
      .merge(Setting.first.default_obstetric_findings)
  end
end
