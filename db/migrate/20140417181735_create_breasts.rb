class CreateBreasts < ActiveRecord::Migration
  def change
    create_table :breasts do |t|
      t.text :left_breast
      t.text :right_breast
      t.text :impression
      t.text :advise

      t.timestamps
    end
  end
end
