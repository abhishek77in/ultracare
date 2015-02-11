class WholeAbdomenFemale < ActiveRecord::Base
  include Reportable

  def printable_fields
    %w(liver gall_bladder pancreas spleen right_kidney left_kidney urinary_bladder uterus adnexa other)
  end

  def possible_genders
    [['Female', 'F']]
  end
end
