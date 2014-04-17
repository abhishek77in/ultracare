class CreateTestes < ActiveRecord::Migration
  def change
    create_table :testes do |t|
      t.text :left_testis
      t.text :right_testis
      t.text :impression

      t.timestamps
    end
  end
end
