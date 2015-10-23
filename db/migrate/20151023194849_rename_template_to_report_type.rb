class RenameTemplateToReportType < ActiveRecord::Migration
  def change
    rename_table :templates, :report_types
  end
end
