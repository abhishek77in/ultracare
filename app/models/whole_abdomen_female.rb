class WholeAbdomenFemale < ActiveRecord::Base
  has_one :report_type, as: :reportable

  def self.params
    {
      liver: 'Appears NORMAL in size, shape & echotexture. No focal lesion or mass seen. Intrahepatic portal redicals are not Dilated.No Sub hepatic fluid seen.',
      gall_bladder: 'Appears NORMAL in size & shape.No stone or sludge seen .Walls are normal. Anterior wall of the G.B. appears not  thickened.C.B.D.and portal vein is not Dilated.',
      pancreas: 'Appears NORMAL in size and echotexture.Pancreatic duct is not dilated. No calcifications seen.',
      spleen: 'Appears normal in size, shape & echotexture. No focal lesion or mass seen.',
      right_kidney: 'Appears NORMAL in size, shape & echotexture. Renal parenchymal & sinus echoes are normal. No hydronephrotic changes seen.Corticomedullary differentiation is normal. No peri renal ascitic fluid seen.',
      left_kidney: 'Appears NORMAL in size, shape & echotexture. Renal parenchymal & sinus echoes are normal. No hydronephrotic changes seen.Corticomedullary differentiation is normal. No peri renal ascitic fluid seen.',
      urinary_bladder: 'Partially filled with urine. Wall is smooth & regular.',
      uterus: 'Appears NORMAL in size, Myometrium echotexture is homogenous. No mass, No fibroid seen. Internal os of cervix appears closed.',
      adnexa: 'RT.ADNEXA-NORMAL. LT.ADNEXA-NORMAL.',
      impression: 'ORGANS ARE UNDER SCAN WITH IN NORMAL LIMITS.'
    }
  end
end
