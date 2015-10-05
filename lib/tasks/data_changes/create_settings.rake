namespace :data_changes do
  desc 'Create settings for the app'
  task :create_settings => :environment do

    if Setting.count > 0
      puts "Settings already exists."
    else
      setting = Setting.new
      setting.print_settings = {"heading"=>"YOUR DIAGNOSTIC CENTRE", "sub_heading"=>"DIAGNOSTIC ULTRASOUND UNIT", "address"=>"Opposite - Your Hospital, City Name", "phone_number"=>"23xx36"}
      setting.default_organ_findings = {
          "liver"=>"Appears NORMAL in size, shape & echotexture. No focal lesion or mass seen. Intrahepatic portal redicals are not Dilated. No Sub hepatic fluid seen.",
          "gall_bladder"=>"Appears NORMAL in size & shape. No stone or sludge seen. Walls are normal. Anterior wall of the G.B. appears not thickened. C.B.D. and portal vein is not Dilated.",
          "pancreas"=>"Appears NORMAL in size and echotexture. Pancreatic duct is not dilated. No calcifications seen.",
          "spleen"=>"Appears normal in size, shape & echotexture. No focal lesion or mass seen.",
          "right_kidney"=>"Appears NORMAL in size, shape & echotexture. Renal parenchymal & sinus echoes are normal. No hydronephrotic changes seen. Corticomedullary differentiation is normal. No peri renal ascitic fluid seen.",
          "left_kidney"=>"Appears NORMAL in size, shape & echotexture. Renal parenchymal & sinus echoes are normal. No hydronephrotic changes seen. Corticomedullary differentiation is normal. No peri renal ascitic fluid seen.",
          "urinary_bladder"=>"Partially filled with urine. Wall is smooth & regular.",
          "prostate"=>"Appears NORMAL in size, shape and weight.",
          "ureter"=>"Upper part of ureter not dilated.",
          "adnexa"=>"RT. ADNEXA-NORMAL.\r\nLT. ADNEXA-NORMAL.",
          "uterus"=>"Appears NORMAL in size, Myometrium echotexture is homogenous. No mass, No fibroid seen. Internal os of cervix appears closed.",
          "thyroid_left_lobe"=>"Appears NORMAL in size, shape & echotexture. No focal lesion seen.",
          "thyroid_right_lobe"=>"Appears NORMAL in size, shape & echotexture. No focal lesion seen.",
          "i_j_v_and_c_a"=>"NORMAL",
          "isthmus"=>"NORMAL",
          "left_testis"=>"Appears NORMAL in size and shape & homogenous in echotexture.",
          "right_testis"=>"Appears NORMAL in size and shape & homogenous in echotexture.",
          "left_breast"=>"Appears NORMAL in echotexture. No mass or cyst seen.",
          "right_breast"=>"Appears NORMAL in echotexture. No mass or cyst seen.",
          "impression"=>"ORGANS UNDER SCAN ARE WITHIN NORMAL LIMITS.",
          "cervix_and_upper_part_of_visualized_vagina" => "The cervix & upper part of visulaized vagina are normal.",
          "ovary_and_adnexa" => "Both ovaries are normal in size & echotexture, both adnexal region are clear.\r\nFollicle seen on 11th day study was 11/11mm. It does not progress in size and reduce in size & Disappear on 14 days study.",
          "cul_de_sac" => "Clear" }
      setting.default_obstetric_findings = {"pregnancy"=>"Single\r\nConfirmed / Viable / Intrauterine", "crl_mm"=>"", "crl_weeks"=>"", "crl_days"=>"", "bpd_mm"=>"", "bpd_weeks"=>"", "bpd_days"=>"", "fl_mm"=>"", "fl_weeks"=>"", "fl_days"=>"", "ac_mm"=>"", "ac_weeks"=>"", "ac_days"=>"", "hc_mm"=>"", "hc_weeks"=>"", "hc_days"=>"", "average_g_a"=>"29 WEEKS O5 DAYS (+- 02 WEEKS)", "presentation_and_lie"=>"VERTEX", "liquor_volume"=>"Appears ADEQUATE in amount.", "cervix_and_o_s"=>"Appears Closed.", "fetal_heart"=>"PULSATING\r\nRate by M+mode 158/bpm.", "fetal_head_movement"=>"NORMAL", "fetal_limbs_movement"=>"NORMAL", "fetal_breathing_movement"=>"NORMAL", "placenta"=>"ANTERIOR", "grade"=>"2nd", "e_d_d"=>"06-06-2014(+- 02 WEEKS)", "e_f_w"=>"1430 gms. (+-20%)", "remarks"=>"Appears Single Viable Intrauterine Fetus with Normal Cardiac & Somatic Activity. Fetal Heart Pulsation clearly Visible. Movements are Positive.", "advise"=>""}
      setting.save

      puts "Settings created."
    end
  end
end
