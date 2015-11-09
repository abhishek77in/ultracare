class UpdateTemplate < ActiveRecord::Migration
  def change
    rename_column :templates, :title, :report_title
    add_column :templates, :name, :string
  end
end
