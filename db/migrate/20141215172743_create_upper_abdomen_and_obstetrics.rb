class CreateUpperAbdomenAndObstetrics < ActiveRecord::Migration
  def change
    create_table :upper_abdomen_and_obstetrics do |t|
      t.text     :liver
      t.text     :gall_bladder
      t.text     :pancreas
      t.text     :spleen
      t.text     :left_kidney
      t.text     :right_kidney
      t.text     :ureter
      t.text     :other
      t.text     :impression
      t.text     :advise

      t.text     :pregnancy
      t.string   :average_g_a
      t.string   :presentation_and_lie
      t.text     :liquor_volume
      t.text     :cervix_and_o_s
      t.text     :fetal_heart
      t.string   :fetal_head_movement
      t.string   :fetal_limbs_movement
      t.string   :fetal_breathing_movement
      t.string   :placenta
      t.string   :grade
      t.string   :e_d_d
      t.string   :e_f_w
      t.text     :remarks
      t.text     :advise
      t.string   :crl_mm
      t.string   :crl_weeks
      t.string   :crl_days
      t.string   :bpd_mm
      t.string   :bpd_weeks
      t.string   :bpd_days
      t.string   :fl_mm
      t.string   :fl_weeks
      t.string   :fl_days
      t.string   :ac_mm
      t.string   :ac_weeks
      t.string   :ac_days
      t.string   :hc_mm
      t.string   :hc_weeks
      t.string   :hc_days

      t.timestamps
    end
  end
end
