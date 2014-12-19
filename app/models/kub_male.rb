class KubMale < ActiveRecord::Base
  include Reportable

  def padding_level
    'high-padding'
  end

  def possible_genders
    [['Male', 'M']]
  end
end
