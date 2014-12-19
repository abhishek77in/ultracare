class WholeAbdomenFemale < ActiveRecord::Base
  include Reportable

  def possible_genders
    [['Female', 'F']]
  end
end
