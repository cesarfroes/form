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

ActiveRecord::Schema.define(version: 20150404002735) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.text     "name"
    t.text     "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "field_elements", force: :cascade do |t|
    t.string   "element"
    t.boolean  "options"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fields", force: :cascade do |t|
    t.integer  "sub_category_id"
    t.integer  "field_element_id"
    t.string   "title"
    t.text     "options"
    t.integer  "order"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "fields", ["field_element_id"], name: "index_fields_on_field_element_id", using: :btree
  add_index "fields", ["sub_category_id"], name: "index_fields_on_sub_category_id", using: :btree

  create_table "sub_categories", force: :cascade do |t|
    t.integer  "category_id"
    t.text     "name"
    t.text     "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sub_categories", ["category_id"], name: "index_sub_categories_on_category_id", using: :btree

  add_foreign_key "fields", "field_elements"
  add_foreign_key "fields", "sub_categories"
end
