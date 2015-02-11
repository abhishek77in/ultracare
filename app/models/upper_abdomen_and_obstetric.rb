class UpperAbdomenAndObstetric < ActiveRecord::Base
  include Reportable

  def printable_fields
    %w(liver gall_bladder pancreas spleen right_kidney left_kidney ureter other)
  end

  def print_template
    'shared/pdf/upper_abdomen_and_obstetric'
  end

  def padding_level
    'low-padding'
  end

  def possible_genders
    [['Female', 'F']]
  end

  def self.params
    Setting.first.default_organ_findings.select { |key, value| column_names.include?(key) }
      .merge(Setting.first.default_obstetric_findings)
  end
end
