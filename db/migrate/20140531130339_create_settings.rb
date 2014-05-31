class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.hstore :print_settings
      t.timestamps
    end
    Setting.create
  end
end
