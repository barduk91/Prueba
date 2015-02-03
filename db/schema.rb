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

ActiveRecord::Schema.define(version: 20141211104557) do

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "cif"
    t.string   "padrino_code"
    t.string   "own_padrino_code"
    t.integer  "role"
    t.boolean  "verified"
    t.string   "registration_date"
    t.string   "deactivationdate"
    t.integer  "sector"
    t.integer  "company_type"
    t.string   "customer_support_email"
    t.string   "secundary_email"
    t.string   "phone_number"
    t.string   "customer_support_phone_number"
    t.string   "main_contact_name"
    t.string   "website"
    t.string   "street_type"
    t.string   "street"
    t.string   "number"
    t.string   "block"
    t.string   "main_entry"
    t.string   "floor"
    t.string   "additional_information"
    t.string   "postcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "password"
    t.integer  "user_id"
  end

  create_table "follows", force: true do |t|
    t.integer  "follower_id"
    t.string   "type_following"
    t.integer  "following_id"
    t.string   "type_follower"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "user_name"
    t.string   "padrino_code"
    t.string   "own_padrino_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "password"
    t.integer  "user_id"
    t.boolean  "verified"
    t.integer  "role"
    t.string   "registration_date"
    t.string   "deactivationdate"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "padrino_code"
    t.string   "own_padrino_code"
    t.string   "password"
    t.string   "deactivationdate"
    t.integer  "role"
    t.string   "registration_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_type"
    t.boolean  "verified"
  end

end
