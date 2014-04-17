class CreateLowerAbdomenFemales < ActiveRecord::Migration
  def change
    create_table :lower_abdomen_females do |t|
      t.text :urinary_bladder
      t.text :uterus
      t.text :adnexa
      t.text :other
      t.text :impression
      t.text :advise

      t.timestamps
    end
  end
end
