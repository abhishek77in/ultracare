class RemoveDegreeFromReferrer < ActiveRecord::Migration
  def change
    remove_column :referrers, :degree
  end
end
