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

ActiveRecord::Schema.define(version: 20160324064923) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: :cascade do |t|
    t.integer  "user_id",                    null: false
    t.integer  "product_id",                 null: false
    t.boolean  "checked",    default: false
    t.integer  "number",     default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "bills", ["product_id"], name: "index_bills_on_product_id", using: :btree
  add_index "bills", ["user_id"], name: "index_bills_on_user_id", using: :btree

  create_table "likeds", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
  end

  add_index "likeds", ["product_id"], name: "index_likeds_on_product_id", using: :btree
  add_index "likeds", ["user_id"], name: "index_likeds_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "price"
    t.string   "name",        null: false
    t.string   "description"
    t.string   "make"
    t.string   "img_link"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string  "name"
    t.string  "email",           default: "",    null: false
    t.string  "password_digest", default: "",    null: false
    t.string  "username",        default: "",    null: false
    t.boolean "visible",         default: true
    t.boolean "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "bills", "products"
  add_foreign_key "bills", "users"
  add_foreign_key "likeds", "products"
  add_foreign_key "likeds", "users"
end
