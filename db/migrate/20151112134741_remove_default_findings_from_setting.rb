class RemoveDefaultFindingsFromSetting < ActiveRecord::Migration
  def change
    remove_column :settings, :default_organ_findings
    remove_column :settings, :default_obstetric_findings
  end
end
