class RenameDisableBusinessReportsInSetting < ActiveRecord::Migration
  def change
    rename_column :settings, :disable_business_reports, :enable_accounting
  end
end
