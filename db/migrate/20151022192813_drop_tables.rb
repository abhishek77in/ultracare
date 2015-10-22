class DropTables < ActiveRecord::Migration
  def change
    drop_table :breasts
    drop_table :follicular_studies
    drop_table :kub_females
    drop_table :kub_males
    drop_table :lower_abdomen_females
    drop_table :obstetrics
    drop_table :report_types
    drop_table :testes
    drop_table :thyroid_glands
    drop_table :upper_abdomen
    drop_table :upper_abdomen_and_obstetrics
    drop_table :whole_abdomen_females
    drop_table :whole_abdomen_males
  end
end
