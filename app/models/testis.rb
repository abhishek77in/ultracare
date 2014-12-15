class Testis < ActiveRecord::Base
  include Reportable

  def padding_level
    'high-padding'
  end
end
