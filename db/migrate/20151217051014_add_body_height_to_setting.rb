class AddBodyHeightToSetting < ActiveRecord::Migration
  def change
    add_column :settings, :report_body_height, :integer, default: 500
  end
end
