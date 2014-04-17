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

ActiveRecord::Schema.define(version: 20140417201814) do

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

  create_table "patients", force: true do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "sex"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "whole_abdomen", force: true do |t|
    t.text     "liver"
    t.text     "gall_bladder"
    t.text     "pancreas"
    t.text     "spleen"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "right_kidney"
    t.text     "left_kidney"
    t.text     "urinary_bladder"
    t.text     "uterus"
    t.text     "adnexa"
    t.text     "other"
    t.text     "impression"
    t.text     "advise"
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
