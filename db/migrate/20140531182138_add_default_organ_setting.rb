class AddDefaultOrganSetting < ActiveRecord::Migration
  def change
    add_column :settings, :default_organ_findings, :text
  end
end
