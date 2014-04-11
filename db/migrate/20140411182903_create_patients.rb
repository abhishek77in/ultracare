class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :title
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :sex

      t.timestamps
    end
  end
end
