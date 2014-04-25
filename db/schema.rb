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

ActiveRecord::Schema.define(version: 20131015003101) do

  create_table "activities", force: true do |t|
    t.date     "day"
    t.string   "name"
    t.text     "description"
    t.text     "thumbnail"
    t.datetime "start_time"
    t.datetime "stop_time"
    t.integer  "day_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activities_providers", id: false, force: true do |t|
    t.integer  "activity_id"
    t.integer  "provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "days", force: true do |t|
    t.date     "day"
    t.string   "name"
    t.text     "description"
    t.integer  "segment_id"
    t.integer  "order_in_segment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plans", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "plan_type"
    t.text     "thumbnail"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "orig_plan_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "preferences", force: true do |t|
    t.integer  "type_of_travelers"
    t.integer  "how_you_travel"
    t.integer  "what_to_see"
    t.integer  "how_long"
    t.integer  "which_region"
    t.integer  "what_season"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.string   "role"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street_address1"
    t.string   "street_address2"
    t.string   "city"
    t.string   "state_province"
    t.string   "country_region"
    t.string   "pin_zip"
    t.string   "phone"
    t.string   "email"
    t.string   "secret_question"
    t.string   "secret_answer"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "providers", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "thumbnail"
    t.string   "provider_type"
    t.string   "street_address1"
    t.string   "street_address2"
    t.string   "city"
    t.string   "state_province"
    t.string   "country_region"
    t.string   "pin_zip"
    t.string   "phone"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "segments", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "thumbnail"
    t.string   "segment_type"
    t.string   "city"
    t.string   "country"
    t.integer  "orig_segment_id"
    t.integer  "plan_id"
    t.integer  "order_in_plan"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
