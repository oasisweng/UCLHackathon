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

ActiveRecord::Schema.define(version: 20131027031823) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rooms", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "postal"
    t.string   "address"
    t.integer  "tenants"
    t.boolean  "smoking"
    t.boolean  "pet"
    t.string   "minimal"
    t.boolean  "billsIncluded"
    t.integer  "Price"
    t.integer  "deposit"
    t.boolean  "rented"
  end

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.string   "phonenumber"
    t.integer  "age"
    t.string   "gender"
    t.string   "university"
    t.string   "course"
    t.string   "ethnics"
    t.string   "nationality"
    t.string   "interest"
    t.string   "hates"
    t.boolean  "smoking"
    t.string   "religion"
    t.string   "paypal"
    t.boolean  "hasPaidDeposit"
    t.integer  "Rid"
    t.integer  "PairdUser"
  end

end
