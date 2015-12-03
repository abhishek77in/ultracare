class AddCapturePatientIdToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :capture_patient_id, :boolean, default: true
  end
end
