class Breast < ActiveRecord::Base
  include Reportable

  def padding_level
    'high-padding'
  end

  def possible_genders
    [['Female', 'F']]
  end
end
