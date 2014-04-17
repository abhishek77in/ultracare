class CreateUpperAbdomen < ActiveRecord::Migration
  def change
    create_table :upper_abdomen do |t|
      t.text :liver
      t.text :gall_bladder
      t.text :pancreas
      t.text :spleen
      t.text :left_kidney
      t.text :right_kidney
      t.text :ureter
      t.text :other
      t.text :impression
      t.text :advise

      t.timestamps
    end
  end
end
