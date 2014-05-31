# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140531182138) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breasts", force: true do |t|
    t.text     "left_breast"
    t.text     "right_breast"
    t.text     "impression"
    t.text     "advise"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "doctors", force: true do |t|
    t.string   "name"
    t.string   "degree"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kub_females", force: true do |t|
    t.text     "left_kidney"
    t.text     "right_kidney"
    t.text     "urinary_bladder"
    t.text     "other"
    t.text     "impression"
    t.text     "advise"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kub_males", force: true do |t|
    t.text     "left_kidney"
    t.text     "right_kidney"
    t.text     "urinary_bladder"
    t.text     "prostate"
    t.text     "other"
    t.text     "impression"
    t.text     "advise"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lower_abdomen_females", force: true do |t|
    t.text     "urinary_bladder"
    t.text     "uterus"
    t.text     "adnexa"
    t.text     "other"
    t.text     "impression"
    t.text     "advise"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "obstetrics", force: true do |t|
    t.text     "pregnancy"
    t.string   "average_g_a"
    t.string   "presentation_and_lie"
    t.text     "liquor_volume"
    t.text     "cervix_and_o_s"
    t.text     "fetal_heart"
    t.string   "fetal_head_movement"
    t.string   "fetal_limbs_movement"
    t.string   "fetal_breathing_movement"
    t.string   "placenta"
    t.string   "grade"
    t.string   "e_d_d"
    t.string   "e_f_w"
    t.text     "remarks"
    t.text     "advise"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "crl_mm"
    t.string   "crl_weeks"
    t.string   "crl_days"
    t.string   "bpd_mm"
    t.string   "bpd_weeks"
    t.string   "bpd_days"
    t.string   "fl_mm"
    t.string   "fl_weeks"
    t.string   "fl_days"
    t.string   "ac_mm"
    t.string   "ac_weeks"
    t.string   "ac_days"
    t.string   "hc_mm"
    t.string   "hc_weeks"
    t.string   "hc_days"
  end

  create_table "patients", force: true do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "sex"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "patients", ["name"], name: "index_patients_on_name", using: :btree

  create_table "report_types", force: true do |t|
    t.integer  "reportable_id"
    t.string   "reportable_type"
    t.integer  "report_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", force: true do |t|
    t.integer  "doctor_id"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: true do |t|
    t.text     "print_settings"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "default_organ_findings"
  end

  create_table "testes", force: true do |t|
    t.text     "left_testis"
    t.text     "right_testis"
    t.text     "impression"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "thyroid_glands", force: true do |t|
    t.text     "left_lobe"
    t.text     "right_lobe"
    t.text     "i_j_v_and_c_a"
    t.text     "isthmus"
    t.text     "other"
    t.text     "impression"
    t.text     "advise"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "upper_abdomen", force: true do |t|
    t.text     "liver"
    t.text     "gall_bladder"
    t.text     "pancreas"
    t.text     "spleen"
    t.text     "left_kidney"
    t.text     "right_kidney"
    t.text     "ureter"
    t.text     "other"
    t.text     "impression"
    t.text     "advise"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "whole_abdomen_females", force: true do |t|
    t.text     "liver"
    t.text     "gall_bladder"
    t.text     "pancreas"
    t.text     "spleen"
    t.text     "left_kidney"
    t.text     "right_kidney"
    t.text     "urinary_bladder"
    t.text     "uterus"
    t.text     "adnexa"
    t.text     "other"
    t.text     "impression"
    t.text     "advise"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "whole_abdomen_males", force: true do |t|
    t.text     "liver"
    t.text     "gall_bladder"
    t.text     "pancreas"
    t.text     "spleen"
    t.text     "left_kidney"
    t.text     "right_kidney"
    t.text     "urinary_bladder"
    t.text     "prostate"
    t.text     "other"
    t.text     "impression"
    t.text     "advise"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
