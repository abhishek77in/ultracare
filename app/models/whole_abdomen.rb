class WholeAbdomen < ActiveRecord::Base
  has_one :report_type, as: :reportable

  def self.params
    { liver: 'Appears NORMAL in size, shape & echotexture. No focal lesion or mass seen. Intrahepatic portal redicals are not Dilated.No Sub hepatic fluid seen.',
      gall_bladder: 'Appears NORMAL in size & shape.No stone or sludge seen .Walls are normal. Anterior wall of the G.B. appears not  thickened.C.B.D.and portal vein is not Dilated.',
      pancreas: 'Appears NORMAL in size and echotexture.Pancreatic duct is not dilated. No calcifications seen.',
      spleen: 'Appears NORMAL in size, Shape & echotexture.No focal lesion or mass seen.' }
  end
end
