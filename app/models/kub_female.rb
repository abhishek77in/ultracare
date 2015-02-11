class KubFemale < ActiveRecord::Base
  include Reportable

  def printable_fields
    %w(right_kidney left_kidney urinary_bladder other)
  end

  def padding_level
    'high-padding'
  end

  def possible_genders
    [['Female', 'F']]
  end
end
