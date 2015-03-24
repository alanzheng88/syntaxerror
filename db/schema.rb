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

ActiveRecord::Schema.define(version: 20150323095003) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: true do |t|
    t.string   "name",       limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "brands", ["name"], name: "index_brands_on_name", unique: true, using: :btree

  create_table "categories", force: true do |t|
    t.string   "name",       limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree

  create_table "homepages", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name",        limit: 30
    t.decimal  "price",                  precision: 10, scale: 2
    t.integer  "brand_id"
    t.integer  "category_id"
    t.integer  "quantity",                                        default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["brand_id"], name: "index_products_on_brand_id", using: :btree
  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "role",       limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",   limit: 30
    t.string   "firstname",  limit: 30
    t.string   "lastname",   limit: 30
    t.string   "password",   limit: 30
    t.string   "email",      limit: 254
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id",                default: 4
  end

  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  create_table "vendors", force: true do |t|
    t.string   "vendor",      limit: 30
    t.integer  "locationkey"
    t.integer  "productkey"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
