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

ActiveRecord::Schema.define(version: 20151022192813) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doctors", force: :cascade do |t|
    t.string   "name"
    t.string   "degree"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "sex"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "patients", ["name"], name: "index_patients_on_name", using: :btree

  create_table "reports", force: :cascade do |t|
    t.integer  "doctor_id"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "amount_collected", default: 0
    t.integer  "amount_due",       default: 0
    t.integer  "doctors_discount", default: 0
    t.text     "content"
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
    t.string   "role"
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

end
