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

ActiveRecord::Schema.define(version: 20150530025402) do

  create_table "coins", force: :cascade do |t|
    t.integer  "face_value",    limit: 5
    t.string   "owner"
    t.string   "holder"
    t.string   "description"
    t.datetime "publish_date"
    t.datetime "transfer_date"
    t.datetime "exchange_date"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.integer  "no"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "own_coins"
    t.integer  "get_coins"
  end

  create_table "gifts", force: :cascade do |t|
    t.integer  "sender_no"
    t.integer  "reciever_no"
    t.integer  "point"
    t.string   "description", limit: 1024
    t.integer  "staff_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "publishes", force: :cascade do |t|
    t.string   "system_name"
    t.string   "employee_name"
    t.integer  "coin_id"
    t.integer  "system_id"
    t.integer  "employee_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.integer  "no"
    t.string   "name",        limit: 32
    t.integer  "point"
    t.string   "gender",      limit: 1
    t.string   "description", limit: 1024
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "phone",       limit: 11
  end

  add_index "staffs", ["no"], name: "index_staffs_on_no", unique: true

  create_table "systems", force: :cascade do |t|
    t.string   "name"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
