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

ActiveRecord::Schema.define(version: 20160128164614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "college_sport_coaches", force: :cascade do |t|
    t.string   "college_name"
    t.string   "coach_name"
    t.string   "coach_position"
    t.integer  "school_id"
    t.integer  "sport_id"
    t.string   "sport_name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "school_coach_sports", force: :cascade do |t|
    t.string   "coach_name"
    t.integer  "sport_id"
    t.integer  "ipeds_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "school_preference_maps", force: :cascade do |t|
    t.integer  "season"
    t.integer  "school_size"
    t.integer  "location_type"
    t.integer  "sport_acedemic_balance"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "school_id",              null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "logo"
    t.string   "mascot_name"
    t.string   "zip"
    t.integer  "ipeds_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "user_preferences", force: :cascade do |t|
    t.integer  "season"
    t.integer  "school_size"
    t.integer  "location_type"
    t.string   "zip"
    t.integer  "sport_id"
    t.integer  "sport_acedemic_balance"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "season"
    t.integer  "school_size"
    t.integer  "location_type"
    t.string   "zip"
    t.integer  "sport_id"
    t.integer  "sport_acedemic_balance"
  end

end
