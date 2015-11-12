class RenameDoctorToReferrer < ActiveRecord::Migration
  def change
    rename_table :doctors, :referrers
    rename_column :reports, :doctor_id, :referrer_id
  end
end
