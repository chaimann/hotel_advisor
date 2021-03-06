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

ActiveRecord::Schema.define(version: 20140701165424) do

  create_table "addresses", force: true do |t|
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "street"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hotel_id"
  end

  create_table "comments", force: true do |t|
    t.string   "content"
    t.integer  "grade_id"
    t.integer  "hotel_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grades", force: true do |t|
    t.integer  "value"
    t.integer  "hotel_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hotels", force: true do |t|
    t.string   "title"
    t.boolean  "breakfast_included"
    t.string   "room_description"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string   "reset_password_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
