class UpdateWholeAbdomenModel < ActiveRecord::Migration
  def change
    add_column :whole_abdomen, :right_kidney, :text
    add_column :whole_abdomen, :left_kidney, :text
    add_column :whole_abdomen, :urinary_bladder, :text
    add_column :whole_abdomen, :uterus, :text
    add_column :whole_abdomen, :adnexa, :text
    add_column :whole_abdomen, :other, :text
    add_column :whole_abdomen, :impression, :text
    add_column :whole_abdomen, :advise, :text
  end
end
