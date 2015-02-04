class WholeAbdomenMale < ActiveRecord::Base
  include Reportable

  def printable_fields
    %w(liver gall_bladder pancreas spleen right_kidney left_kidney urinary_bladder prostate other advise)
  end

  def possible_genders
    [['Male', 'M']]
  end
end
