class UpdatePregnancyColumnToText < ActiveRecord::Migration
  def change
    change_column :obstetrics, :pregnancy, :text
  end
end
