class AddDefaultObstetricFindings < ActiveRecord::Migration
  def change
    add_column :settings, :default_obstetric_findings, :text
  end
end
