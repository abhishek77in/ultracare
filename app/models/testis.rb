class Testis < ActiveRecord::Base
  include Reportable

  def printable_fields
    %w(right_testis left_testis)
  end

  def padding_level
    'high-padding'
  end

  def possible_genders
    [['Male', 'M']]
  end
end
