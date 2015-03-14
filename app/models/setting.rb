class Setting < ActiveRecord::Base
  store :print_settings, accessors: [:heading, :sub_heading, :address, :phone_number, :consultant_1, :consultant_2], coder: JSON
  store :default_organ_findings, accessors: [:liver, :gall_bladder, :pancreas, :spleen, :right_kidney,
    :left_kidney, :urinary_bladder, :prostate, :ureter, :adnexa, :uterus, :thyroid_left_lobe, :thyroid_right_lobe,
    :i_j_v_and_c_a, :isthmus, :left_testis, :right_testis, :left_breast, :right_breast, :impression], coder: JSON
  store :default_obstetric_findings, accessors: [:pregnancy, :average_g_a, :presentation_and_lie, :liquor_volume,
    :cervix_and_o_s, :fetal_heart, :fetal_head_movement, :fetal_limbs_movement, :fetal_breathing_movement,
    :placenta, :grade, :e_d_d, :e_f_w, :remarks, :advise, :crl_mm, :crl_weeks,
    :crl_days, :bpd_mm, :bpd_weeks, :bpd_days, :fl_mm, :fl_weeks, :fl_days, :ac_mm,
    :ac_weeks, :ac_days, :hc_mm, :hc_weeks, :hc_days], coder: JSON

  validates :show_max_reports, numericality: { greater_than: 0, allow_nil: true  }
end
