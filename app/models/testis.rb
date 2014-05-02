class Testis < ActiveRecord::Base
  has_one :report_type, as: :reportable

  def self.params
    {
      left_testis: 'Appears NORMAL in size and shape & homogenous in echotexture.',
      right_testis: 'Appears NORMAL in size and shape & homogenous in echotexture.',
      impression: 'ORGANS ARE UNDER SCAN WITH IN NORMAL LIMITS.'
    }
  end
end
