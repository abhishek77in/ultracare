class KubFemale < ActiveRecord::Base
  has_one :report_type, as: :reportable

  def self.params
    {
      right_kidney: 'Appears NORMAL in size, shape & echotexture. Renal parenchymal & sinus echoes are normal. No hydronephrotic changes seen. Corticomedullary differentiation is normal. No peri renal ascitic fluid seen.',
      left_kidney: 'Appears NORMAL in size, shape & echotexture. Renal parenchymal & sinus echoes are normal. No hydronephrotic changes seen. Corticomedullary differentiation is normal. No peri renal ascitic fluid seen.',
      urinary_bladder: 'Partially filled with urine. Wall is smooth & regular.',
      other: 'Upper part of ureters are not dilated.',
      impression: 'ORGANS ARE UNDER SCAN WITH IN NORMAL LIMITS.'
    }
  end
end
