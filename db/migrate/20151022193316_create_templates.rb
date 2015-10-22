class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :ultrasound_type
      t.text :content

      t.timestamps null: false
    end
  end
end
