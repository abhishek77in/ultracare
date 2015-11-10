class AddPatientIdToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :patient_id, :string
  end
end
