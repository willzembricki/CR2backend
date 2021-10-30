# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_30_194508) do

  create_table "crimes", force: :cascade do |t|
    t.integer "state_id", null: false
    t.string "crime_name"
    t.integer "pop"
    t.integer "asian_pop"
    t.integer "hawaiian"
    t.integer "black"
    t.integer "american_indian"
    t.integer "unknown"
    t.integer "white"
    t.integer "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["state_id"], name: "index_crimes_on_state_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "abbv"
    t.string "name"
    t.integer "pop"
    t.integer "asian_pop"
    t.integer "hawaiian"
    t.integer "black"
    t.integer "american_indian"
    t.integer "unknown"
    t.integer "white"
    t.integer "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "crimes", "states"
end
