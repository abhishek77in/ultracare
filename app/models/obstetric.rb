class Obstetric < ActiveRecord::Base
  has_one :report_type, as: :reportable

  def self.params
    {
      pregnancy: 'Confirmed',
      bpd: '73, 29, 03',
      fl: '57,30,03',
      ac: '251,29,00',
      average_g_a: '29 WEEKS O5 DAYS (+- 02 WEEKS)',
      presentation_and_lie: 'VERTEX',
      liquor_volume: 'Appears ADEQUATE in amount.',
      cervix_and_o_s: 'Appears Closed.',
      fetal_heart: "PULSATING\nRate by M+mode 158/bpm.",
      head_movement: 'NORMAL',
      limbs_movement: 'NORMAL',
      breathing_movement: 'NORMAL',
      placenta: 'ANTERIOR',
      grade: '2nd',
      e_d_d: '06-06-2014(+- 02 WEEKS)',
      e_f_w: '1430 gms. (+-20%)',
      remarks: 'Appears Single Viable Intrauterine Fetus with Normal Cardiac & Somatic Activity. Fetal Heart Pulsation clearly Visible. Movements are Positive.',
      advise: ''
    }
  end
end
