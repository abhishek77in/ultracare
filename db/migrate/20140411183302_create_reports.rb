class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :doctor
      t.references :patient
      t.timestamps
    end
  end
end
