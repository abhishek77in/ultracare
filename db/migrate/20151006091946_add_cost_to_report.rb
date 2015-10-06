class AddCostToReport < ActiveRecord::Migration
  def change
    add_column :reports, :cost, :integer
  end
end
