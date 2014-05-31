class Setting < ActiveRecord::Base
  store :print_settings, accessors: [:heading, :sub_heading, :address, :phone_number, :consultant_1, :consultant_2], coder: JSON
  store :default_organ_findings, accessors: [:liver, :gall_bladder, :pancreas, :spleen, :right_kidney,
    :left_kidney, :urinary_bladder, :prostate, :ureter, :adnexa, :uterus, :thyroid_left_lobe, :thyroid_right_lobe,
    :i_j_v_and_c_a, :isthmus, :left_testis, :right_testis, :left_breast, :right_breast, :impression], coder: JSON
end
