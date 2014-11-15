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

ActiveRecord::Schema.define(version: 20141115182822) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comission_participants", force: true do |t|
    t.integer "comission_id"
    t.integer "legislator_id"
    t.string  "extra_info"
  end

  create_table "comissions", force: true do |t|
    t.string "name"
    t.string "chamber"
    t.string "comission_type"
  end

  create_table "legislators", force: true do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "email"
    t.string  "picture_url"
    t.integer "political_party_id"
    t.string  "chamber"
    t.string  "state"
    t.integer "citations_count"
    t.integer "attendances_count"
  end

  create_table "parliament_sessions", force: true do |t|
    t.string "chamber"
    t.date   "date"
  end

  create_table "political_parties", force: true do |t|
    t.string "name"
  end

  create_table "topics", force: true do |t|
    t.string  "name"
    t.integer "parliament_session_id"
  end

end
