class LowerAbdomenFemale < ActiveRecord::Base
  has_one :report_type, as: :reportable

  def self.params
    {
      urinary_bladder: 'Partially filled with urine. Wall is smooth & regular.',
      uterus: 'Appears NORMAL in size, Myometrium echotexture is homogenous. No mass, No fibroid seen. Internal os of cervix appears closed.',
      adnexa: "RT.ADNEXA-NORMAL.\nLT.ADNEXA-NORMAL.",
      impression: 'ORGANS ARE UNDER SCAN WITH IN NORMAL LIMITS.'
    }
  end
end
