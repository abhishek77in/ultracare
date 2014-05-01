class ThyroidGland < ActiveRecord::Base
  has_one :report_type, as: :reportable

  def self.params
    {
      left_lobe: 'Appears NORMAL in size, shape & echotexture. No focal lesion seen.',
      right_lobe: 'Appears NORMAL in size, shape & echotexture. No focal lesion seen.',
      impression: 'MINIMAL FLUID COLLECTION SEEN IN RIGHT TESTIS.',
      i_j_v_and_c_a: 'NORMAL',
      isthmus: 'NORMAL',
      impression: 'ORGANS ARE UNDER SCAN WITH IN NORMAL LIMITS.'
    }
  end
end
