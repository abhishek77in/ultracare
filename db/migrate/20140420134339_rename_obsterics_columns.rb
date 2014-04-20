class RenameObstericsColumns < ActiveRecord::Migration
  def change
    rename_column :obstetrics, :head_movement, :fetal_head_movement
    rename_column :obstetrics, :limbs_movement, :fetal_limbs_movement
    rename_column :obstetrics, :breathing_movement, :fetal_breathing_movement
  end
end
