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

ActiveRecord::Schema.define(version: 20160322140101) do

  create_table "fruits", force: :cascade do |t|
    t.integer  "plantation_id"
    t.string   "name"
    t.string   "variety"
    t.string   "color"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "fruits", ["plantation_id"], name: "index_fruits_on_plantation_id"

  create_table "plantations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "location"
  end

  add_index "plantations", ["name"], name: "index_plantations_on_name", unique: true

  create_table "vegetables", force: :cascade do |t|
    t.integer  "plantation_id"
    t.string   "name"
    t.string   "variety"
    t.string   "color"
    t.integer  "time"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "vegetables", ["plantation_id"], name: "index_vegetables_on_plantation_id"

end
