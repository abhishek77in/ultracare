class RenameUltrasoundTypeToTitle < ActiveRecord::Migration
  def change
    rename_column :templates, :ultrasound_type, :title
  end
end
