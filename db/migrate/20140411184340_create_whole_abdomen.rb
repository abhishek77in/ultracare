class CreateWholeAbdomen < ActiveRecord::Migration
  def change
    create_table :whole_abdomen do |t|
      t.text :liver
      t.text :gall_bladder
      t.text :pancreas
      t.text :spleen

      t.timestamps
    end
  end
end
