class CreateWholeAbdomenFemales < ActiveRecord::Migration
  def change
    create_table :whole_abdomen_females do |t|
      t.text :liver
      t.text :gall_bladder
      t.text :pancreas
      t.text :spleen
      t.text :left_kidney
      t.text :right_kidney
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
