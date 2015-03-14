class AddFieldInSettings < ActiveRecord::Migration
  def change
    add_column :settings, :show_reports_from_last_days, :integer
  end
end
