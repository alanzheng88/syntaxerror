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

ActiveRecord::Schema.define(version: 20150317051047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "homepages", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.decimal  "price",      precision: 8, scale: 2
    t.string   "brand"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "role",       limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",    limit: 30
    t.string   "firstname",   limit: 30
    t.string   "lastname",    limit: 30
    t.string   "password",    limit: 30
    t.string   "email",       limit: 254
    t.integer  "rolekey"
    t.integer  "userlistkey"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendors", force: true do |t|
    t.string   "vendor",      limit: 30
    t.integer  "locationkey"
    t.integer  "productkey"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
