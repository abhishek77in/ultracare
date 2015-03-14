class RenameFieldInSettings < ActiveRecord::Migration
  def change
    rename_column :settings, :show_reports_till_date, :show_reports_from_date
  end
end
