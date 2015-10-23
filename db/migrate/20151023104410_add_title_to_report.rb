class AddTitleToReport < ActiveRecord::Migration
  def change
    add_column :reports, :title, :string
  end
end
