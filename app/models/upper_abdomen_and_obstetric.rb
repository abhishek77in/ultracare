class UpperAbdomenAndObstetric < ActiveRecord::Base
  include Reportable

  def printable_fields
    %w(liver gall_bladder pancreas spleen left_kidney right_kidney ureter other impression advise)
  end

  def print_template
    'shared/pdf/upper_abdomen_and_obstetric'
  end

  def self.params
    Setting.first.default_organ_findings.select { |key, value| column_names.include?(key) }
      .merge(Setting.first.default_obstetric_findings)
  end
end
