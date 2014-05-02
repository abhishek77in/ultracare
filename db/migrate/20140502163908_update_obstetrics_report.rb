class UpdateObstetricsReport < ActiveRecord::Migration
  def change
    change_column :obstetrics, :crl_mm, :string
    change_column :obstetrics, :crl_weeks, :string
    change_column :obstetrics, :crl_days, :string

    change_column :obstetrics, :bpd_mm, :string
    change_column :obstetrics, :bpd_weeks, :string
    change_column :obstetrics, :bpd_days, :string

    change_column :obstetrics, :fl_mm, :string
    change_column :obstetrics, :fl_weeks, :string
    change_column :obstetrics, :fl_days, :string

    change_column :obstetrics, :ac_mm, :string
    change_column :obstetrics, :ac_weeks, :string
    change_column :obstetrics, :ac_days, :string

    change_column :obstetrics, :hc_mm, :string
    change_column :obstetrics, :hc_weeks, :string
    change_column :obstetrics, :hc_days, :string
  end
end
