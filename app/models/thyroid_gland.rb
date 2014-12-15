class ThyroidGland < ActiveRecord::Base
  include Reportable

  def print_template
    'shared/pdf/thyroid_gland'
  end

end
