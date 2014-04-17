kclass CreateThyroidGlands < ActiveRecord::Migration
  def change
    create_table :thyroid_glands do |t|
      t.text :left_lobe
      t.text :right_lobe
      t.text :i_j_v_and_c_a
      t.text :isthmus
      t.text :other
      t.text :impression
      t.text :advise

      t.timestamps
    end
  end
end
