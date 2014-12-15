class ThyroidGland < ActiveRecord::Base
  include Reportable

  def print_template
    'shared/pdf/thyroid_gland'
  end

  def padding_level
    'high-padding'
  end

end
