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

ActiveRecord::Schema.define(version: 20150403074904) do

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

  create_table "inventories", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventories_products", id: false, force: true do |t|
    t.integer "inventory_id", null: false
    t.integer "product_id",   null: false
  end

  add_index "inventories_products", ["inventory_id", "product_id"], name: "index_inventories_products_on_inventory_id_and_product_id", using: :btree
  add_index "inventories_products", ["product_id", "inventory_id"], name: "index_inventories_products_on_product_id_and_inventory_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "name",        limit: 30
    t.integer  "brand_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",                                        default: 1
    t.decimal  "unitprice",              precision: 10, scale: 2, default: 0.0
  end

  add_index "products", ["brand_id"], name: "index_products_on_brand_id", using: :btree
  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "products_sales", id: false, force: true do |t|
    t.integer "product_id", null: false
    t.integer "sale_id",    null: false
  end

  add_index "products_sales", ["product_id", "sale_id"], name: "index_products_sales_on_product_id_and_sale_id", using: :btree
  add_index "products_sales", ["sale_id", "product_id"], name: "index_products_sales_on_sale_id_and_product_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name",       limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales", force: true do |t|
    t.decimal  "unitprice",  precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vendor_id"
    t.integer  "quantity",                            default: 1
  end

  add_index "sales", ["vendor_id"], name: "index_sales_on_vendor_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",   limit: 30
    t.string   "firstname",  limit: 30
    t.string   "lastname",   limit: 30
    t.string   "password",   limit: 30
    t.string   "email",      limit: 254
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id",                default: 4
    t.integer  "vendor_id"
  end

  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree
  add_index "users", ["vendor_id"], name: "index_users_on_vendor_id", using: :btree

  create_table "vendors", force: true do |t|
    t.string   "name",         limit: 30
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "inventory_id"
  end

  add_index "vendors", ["inventory_id"], name: "index_vendors_on_inventory_id", using: :btree

end
