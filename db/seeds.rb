# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

today = DateTime.now

10.times do
  Doctor.create(name: Faker::Name.name, degree: 'MBBS')
end

setting = Setting.first || Setting.new
setting.print_settings = {"heading"=>"BALRAMPUR DIAGNOSTIC CENTRE", "sub_heading"=>"DIAGNOSTIC ULTRASOUND UNIT", "address"=>"Opposite - Memorial Hospital, Balrampur", "phone_number"=>"232436", "consultant_1"=>"", "consultant_2"=>""}
setting.default_organ_findings = {"liver"=>"Appears NORMAL in size, shape & echotexture. No focal lesion or mass seen. Intrahepatic portal redicals are not Dilated. No Sub hepatic fluid seen.", "gall_bladder"=>"Appears NORMAL in size & shape. No stone or sludge seen. Walls are normal. Anterior wall of the G.B. appears not thickened. C.B.D. and portal vein is not Dilated.", "pancreas"=>"Appears NORMAL in size and echotexture. Pancreatic duct is not dilated. No calcifications seen.", "spleen"=>"Appears normal in size, shape & echotexture. No focal lesion or mass seen.", "right_kidney"=>"Appears NORMAL in size, shape & echotexture. Renal parenchymal & sinus echoes are normal. No hydronephrotic changes seen. Corticomedullary differentiation is normal. No peri renal ascitic fluid seen.", "left_kidney"=>"Appears NORMAL in size, shape & echotexture. Renal parenchymal & sinus echoes are normal. No hydronephrotic changes seen. Corticomedullary differentiation is normal. No peri renal ascitic fluid seen.", "urinary_bladder"=>"Partially filled with urine. Wall is smooth & regular.", "prostate"=>"Appears NORMAL in size, shape and weight.", "ureter"=>"Upper part of ureter not dilated.", "adnexa"=>"RT. ADNEXA-NORMAL.\r\nLT. ADNEXA-NORMAL.", "uterus"=>"Appears NORMAL in size, Myometrium echotexture is homogenous. No mass, No fibroid seen. Internal os of cervix appears closed.", "thyroid_left_lobe"=>"Appears NORMAL in size, shape & echotexture. No focal lesion seen.", "thyroid_right_lobe"=>"Appears NORMAL in size, shape & echotexture. No focal lesion seen.", "i_j_v_and_c_a"=>"NORMAL", "isthmus"=>"NORMAL", "left_testis"=>"Appears NORMAL in size and shape & homogenous in echotexture.", "right_testis"=>"Appears NORMAL in size and shape & homogenous in echotexture.", "left_breast"=>"Appears NORMAL in echotexture. No mass or cyst seen.", "right_breast"=>"Appears NORMAL in echotexture. No mass or cyst seen.", "impression"=>"ORGANS ARE UNDER SCAN WITHIN NORMAL LIMITS."}
setting.default_obstetric_findings = {"pregnancy"=>"Single\r\nConfirmed / Viable / Intrauterine", "crl_mm"=>"", "crl_weeks"=>"", "crl_days"=>"", "bpd_mm"=>"", "bpd_weeks"=>"", "bpd_days"=>"", "fl_mm"=>"", "fl_weeks"=>"", "fl_days"=>"", "ac_mm"=>"", "ac_weeks"=>"", "ac_days"=>"", "hc_mm"=>"", "hc_weeks"=>"", "hc_days"=>"", "average_g_a"=>"29 WEEKS O5 DAYS (+- 02 WEEKS)", "presentation_and_lie"=>"VERTEX", "liquor_volume"=>"Appears ADEQUATE in amount.", "cervix_and_o_s"=>"Appears Closed.", "fetal_heart"=>"PULSATING\r\nRate by M+mode 158/bpm.", "fetal_head_movement"=>"NORMAL", "fetal_limbs_movement"=>"NORMAL", "fetal_breathing_movement"=>"NORMAL", "placenta"=>"ANTERIOR", "grade"=>"2nd", "e_d_d"=>"06-06-2014(+- 02 WEEKS)", "e_f_w"=>"1430 gms. (+-20%)", "remarks"=>"Appears Single Viable Intrauterine Fetus with Normal Cardiac & Somatic Activity. Fetal Heart Pulsation clearly Visible. Movements are Positive.", "advise"=>""}
setting.save

30.times do
  rand(10..60).times do
    patient = Patient.new(name: Faker::Name.name, age: Faker::Number.number(2), sex: 'F' )
    doctor = Doctor.first(rand(Doctor.count) + 1).last
    reportable_model = [UpperAbdomenAndObstetric, WholeAbdomenMale, Testis, WholeAbdomenFemale, Obstetric, KubFemale, UpperAbdomen, ThyroidGland, KubMale, Breast, LowerAbdomenFemale].sample
    reportable = reportable_model.new(reportable_model.params)
    report = Report.new(patient: patient, doctor: doctor, created_at: today)
    report.report_type = ReportType.new(reportable: reportable)
    if report.save && report.report_type.save
      puts "Report created for patient - #{report.patient.name}, doctor - #{report.doctor.name}, Date - #{today}"
    else
      puts "Failed to save report - #{report.errors.messages}"
    end
  end
  today = today.prev_day
end
