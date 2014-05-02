class AddHcToObstetricsReport < ActiveRecord::Migration
  def change
    add_column :obstetrics, :hc_mm, :integer
    add_column :obstetrics, :hc_weeks, :integer
    add_column :obstetrics, :hc_days, :integer
  end
end
