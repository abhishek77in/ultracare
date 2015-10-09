class AddDueAndDoctorDiscountToReport < ActiveRecord::Migration
  def change
    add_column :reports, :amount_due, :integer, default: 0
    add_column :reports, :doctors_discount, :integer, default: 0
    rename_column :reports, :cost, :amount_collected
  end
end
