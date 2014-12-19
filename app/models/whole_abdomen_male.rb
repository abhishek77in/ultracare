class WholeAbdomenMale < ActiveRecord::Base
  include Reportable

  def possible_genders
    [['Male', 'M']]
  end
end
