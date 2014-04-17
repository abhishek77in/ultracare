class Breast < ActiveRecord::Base
  has_one :report_type, as: :reportable

  def self.params
    {
      left_breast: 'Appears NORMAL in echotexture. No mass or cyst seen.',
      right_breast: 'Appears NORMAL in echotexture. No mass or cyst seen.',
      impression: 'ORGANS ARE UNDER SCAN WITH IN NORMAL LIMITS.'
    }
  end
end
