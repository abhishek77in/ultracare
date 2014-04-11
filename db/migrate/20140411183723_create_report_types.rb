class CreateReportTypes < ActiveRecord::Migration
  def change
    create_table :report_types do |t|
      t.integer :reportable_id
      t.string :reportable_type
      t.references :report
      t.timestamps
    end
  end
end
