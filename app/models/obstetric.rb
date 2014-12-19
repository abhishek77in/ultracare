class Obstetric < ActiveRecord::Base
  include Reportable

  def print_template
    'shared/pdf/obstetric'
  end

  def padding_level
    'low-padding'
  end

  def possible_genders
    [['Female', 'F']]
  end

  def self.params
    Setting.first.default_obstetric_findings
  end
end
