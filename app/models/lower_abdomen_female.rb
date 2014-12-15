class LowerAbdomenFemale < ActiveRecord::Base
  include Reportable

  def print_template
    'shared/pdf/lower_abdomen_female'
  end

end
