class UpdateObstetricReport < ActiveRecord::Migration
  def change
    remove_column :obstetrics, :bpd
    remove_column :obstetrics, :fl
    remove_column :obstetrics, :ac

    add_column :obstetrics, :crl_mm, :integer
    add_column :obstetrics, :crl_weeks, :integer
    add_column :obstetrics, :crl_days, :integer

    add_column :obstetrics, :bpd_mm, :integer
    add_column :obstetrics, :bpd_weeks, :integer
    add_column :obstetrics, :bpd_days, :integer

    add_column :obstetrics, :fl_mm, :integer
    add_column :obstetrics, :fl_weeks, :integer
    add_column :obstetrics, :fl_days, :integer

    add_column :obstetrics, :ac_mm, :integer
    add_column :obstetrics, :ac_weeks, :integer
    add_column :obstetrics, :ac_days, :integer
  end
end
