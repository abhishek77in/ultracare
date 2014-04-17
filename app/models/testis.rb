class Testis < ActiveRecord::Base
  has_one :report_type, as: :reportable

  def self.params
    {
      left_testis: 'Not Scanned.',
      right_testis: 'Appears homogenous in echotexture. Minimal Fluid Collection seen.',
      impression: 'MINIMAL FLUID COLLECTION SEEN IN RIGHT TESTIS.'
    }
  end
end
