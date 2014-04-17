class CreateKubMales < ActiveRecord::Migration
  def change
    create_table :kub_males do |t|
      t.text :left_kidney
      t.text :right_kidney
      t.text :urinary_bladder
      t.text :prostate
      t.text :other
      t.text :impression
      t.text :advise

      t.timestamps
    end
  end
end
