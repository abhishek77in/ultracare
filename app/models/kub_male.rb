class KubMale < ActiveRecord::Base
  include Reportable

  def printable_fields
    %w(right_kidney left_kidney urinary_bladder prostate other advise)
  end

  def padding_level
    'high-padding'
  end

  def possible_genders
    [['Male', 'M']]
  end
end
