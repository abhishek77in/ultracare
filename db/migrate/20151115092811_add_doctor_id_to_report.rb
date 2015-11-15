class AddDoctorIdToReport < ActiveRecord::Migration
  def change
    add_column :reports, :doctor_id, :integer
  end
end
