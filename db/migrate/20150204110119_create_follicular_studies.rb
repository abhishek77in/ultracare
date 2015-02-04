class CreateFollicularStudies < ActiveRecord::Migration
  def change
    create_table :follicular_studies do |t|
      t.text :urinary_bladder
      t.text :cervix_and_upper_part_of_visualized_vagina
      t.text :uterus
      t.text :ovary_and_adnexa
      t.text :cul_de_sac
      t.text :impression

      t.timestamps
    end
  end
end
