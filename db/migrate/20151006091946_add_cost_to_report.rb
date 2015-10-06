class AddCostToReport < ActiveRecord::Migration
  def change
    add_column :reports, :cost, :integer, default: 0
  end
end
