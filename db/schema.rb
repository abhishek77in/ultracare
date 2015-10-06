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

ActiveRecord::Schema.define(version: 20151006091946) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breasts", force: :cascade do |t|
    t.text     "left_breast"
    t.text     "right_breast"
    t.text     "impression"
    t.text     "advise"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "doctors", force: :cascade do |t|
    t.string   "name"
    t.string   "degree"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "follicular_studies", force: :cascade do |t|
    t.text     "urinary_bladder"
    t.text     "cervix_and_upper_part_of_visualized_vagina"
    t.text     "uterus"
    t.text     "ovary_and_adnexa"
    t.text     "cul_de_sac"
    t.text     "impression"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kub_females", force: :cascade do |t|
    t.text     "left_kidney"
    t.text     "right_kidney"
    t.text     "urinary_bladder"
    t.text     "other"
    t.text     "impression"
    t.text     "advise"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kub_males", force: :cascade do |t|
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

  create_table "lower_abdomen_females", force: :cascade do |t|
    t.text     "urinary_bladder"
    t.text     "uterus"
    t.text     "adnexa"
    t.text     "other"
    t.text     "impression"
    t.text     "advise"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "obstetrics", force: :cascade do |t|
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

  create_table "patients", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "sex"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "patients", ["name"], name: "index_patients_on_name", using: :btree

  create_table "report_types", force: :cascade do |t|
    t.integer  "reportable_id"
    t.string   "reportable_type"
    t.integer  "report_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "doctor_id"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cost"
  end

  create_table "settings", force: :cascade do |t|
    t.text     "print_settings"
    t.text     "default_organ_findings"
    t.text     "default_obstetric_findings"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "disable_reports",             default: false
    t.boolean  "disable_business_analysis",   default: false
    t.boolean  "disable_business_reports",    default: false
    t.integer  "show_max_reports"
    t.date     "show_reports_from_date"
    t.integer  "show_reports_from_last_days"
  end

  create_table "testes", force: :cascade do |t|
    t.text     "left_testis"
    t.text     "right_testis"
    t.text     "impression"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "thyroid_glands", force: :cascade do |t|
    t.text     "thyroid_left_lobe"
    t.text     "thyroid_right_lobe"
    t.text     "i_j_v_and_c_a"
    t.text     "isthmus"
    t.text     "other"
    t.text     "impression"
    t.text     "advise"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "upper_abdomen", force: :cascade do |t|
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

  create_table "upper_abdomen_and_obstetrics", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  create_table "whole_abdomen_females", force: :cascade do |t|
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

  create_table "whole_abdomen_males", force: :cascade do |t|
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
