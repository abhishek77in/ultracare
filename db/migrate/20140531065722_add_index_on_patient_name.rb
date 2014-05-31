class AddIndexOnPatientName < ActiveRecord::Migration
  def change
    add_index :patients, :name
  end
end
