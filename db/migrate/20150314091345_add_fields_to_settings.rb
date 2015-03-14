class AddFieldsToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :disable_reports, :boolean, default: false
    add_column :settings, :disable_business_analysis, :boolean, default: false
    add_column :settings, :disable_business_reports, :boolean, default: false
    add_column :settings, :show_max_reports, :integer
    add_column :settings, :show_reports_till_date, :date
  end
end
