class WholeAbdomen < ActiveRecord::Base
  has_one :report_type, as: :reportable

  def self.params
    {
      liver: 'Appears NORMAL in size, shape & echotexture. No focal lesion or mass seen. Intrahepatic portal redicals are not Dilated.No Sub hepatic fluid seen.',
      gall_bladder: 'Appears NORMAL in size & shape.No stone or sludge seen .Walls are normal. Anterior wall of the G.B. appears not  thickened.C.B.D.and portal vein is not Dilated.',
      pancreas: 'Appears NORMAL in size and echotexture.Pancreatic duct is not dilated. No calcifications seen.',
      spleen: 'appears normal in size, shape & echotexture. no focal lesion or mass seen.',
      right_kidney: 'appears normal in size, shape & echotexture. no focal lesion or mass seen.',
      left_kidney: 'appears normal in size, shape & echotexture. no focal lesion or mass seen.',
      urinary_bladder: 'appears normal in size, shape & echotexture. no focal lesion or mass seen.',
      uterus: 'appears normal in size, shape & echotexture. no focal lesion or mass seen.',
      adnexa: 'appears normal in size, shape & echotexture. no focal lesion or mass seen.',
      other: 'appears normal in size, shape & echotexture. no focal lesion or mass seen.',
      impression: 'appears normal in size, shape & echotexture. no focal lesion or mass seen.',
      advise: 'appears normal in size, shape & echotexture. no focal lesion or mass seen.'
    }
  end

  def fields
    self.attributes.keys - %w(id created_at updated_at)
  end
end
