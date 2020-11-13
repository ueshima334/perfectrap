# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_13_114240) do

  create_table "horses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.integer "horsegender_id", null: false
    t.integer "age_id", null: false
  end

  create_table "plans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title", null: false
    t.string "grade"
    t.string "terms", null: false
    t.date "day", null: false
    t.string "place", null: false
    t.string "horse1"
    t.string "horse2"
    t.string "horse3"
    t.string "horse4"
    t.string "horse5"
    t.string "horse6"
    t.string "horse7"
    t.string "horse8"
    t.string "horse9"
    t.string "horse10"
    t.string "horse11"
    t.string "horse12"
    t.string "horse13"
    t.string "horse14"
    t.string "horse15"
    t.string "horse16"
    t.string "horse17"
    t.string "horse18"
  end

  create_table "races", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.date "day", null: false
    t.string "place", null: false
    t.string "racetrack", null: false
    t.string "horse1", null: false
    t.string "horse2"
    t.string "horse3"
    t.string "horse4"
    t.string "horse5"
    t.string "horse6"
    t.string "horse7"
    t.string "horse8"
    t.string "horse9"
    t.string "horse10"
    t.string "horse11"
    t.string "horse12"
    t.string "horse13"
    t.string "horse14"
    t.string "horse15"
    t.string "horse16"
    t.string "horse17"
    t.string "horse18"
  end

  create_table "raps", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "pace", null: false
    t.string "m200"
    t.string "m400"
    t.string "m600"
    t.string "m800"
    t.string "m1000"
    t.string "m1200"
    t.string "m1400"
    t.string "m1600"
    t.string "m1800"
    t.string "m2000"
    t.string "m2200"
    t.string "m2400"
    t.string "m2600"
    t.string "m2800"
    t.string "m3000"
    t.string "m3200"
    t.bigint "race_id"
    t.index ["race_id"], name: "index_raps_on_race_id"
  end

  add_foreign_key "raps", "races"
end
