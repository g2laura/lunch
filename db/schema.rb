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

ActiveRecord::Schema.define(version: 20141010194312) do

  create_table "items", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price",         precision: 8, scale: 2
    t.string   "image"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "restaurant_id"
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id", using: :btree
  add_index "items", ["restaurant_id"], name: "index_items_on_restaurant_id", using: :btree

  create_table "menus", force: true do |t|
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "menus", ["restaurant_id"], name: "index_menus_on_restaurant_id", using: :btree

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "slogan"
    t.string   "phone_number"
    t.string   "email"
    t.text     "address"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "facebook"
    t.string   "website"
    t.boolean  "delivery"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "username"
    t.string   "avatar"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
