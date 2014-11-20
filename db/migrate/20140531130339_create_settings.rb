class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.text :print_settings
      t.text :default_organ_findings
      t.text :default_obstetric_findings
      t.timestamps
    end
  end
end
