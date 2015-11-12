class RenameDoctorToReferrer < ActiveRecord::Migration
  def change
    rename_table :doctors, :referrers
    rename_column :reports, :doctor_id, :referrer_id
    rename_column :reports, :doctors_discount, :referrers_discount
  end
end
