class CreateObstetrics < ActiveRecord::Migration
  def change
    create_table :obstetrics do |t|
      t.string :pregnancy
      t.string :bpd
      t.string :fl
      t.string :ac
      t.string :average_g_a
      t.string :presentation_and_lie
      t.text :liquor_volume
      t.text :cervix_and_o_s
      t.text :fetal_heart
      t.string :head_movement
      t.string :limbs_movement
      t.string :breathing_movement
      t.string :placenta
      t.string :grade
      t.string :e_d_d
      t.string :e_f_w
      t.text :remarks
      t.text :advise

      t.timestamps
    end
  end
end
