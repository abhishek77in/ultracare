class Breast < ActiveRecord::Base
  include Reportable

  def printable_fields
    %w(right_breast left_breast)
  end

  def padding_level
    'high-padding'
  end

  def possible_genders
    [['Female', 'F']]
  end
end
