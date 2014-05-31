class RenameThryroidColumns < ActiveRecord::Migration
  def change
    rename_column :thyroid_glands, :left_lobe, :thyroid_left_lobe
    rename_column :thyroid_glands, :right_lobe, :thyroid_right_lobe
  end
end
