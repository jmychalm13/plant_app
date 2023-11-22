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

ActiveRecord::Schema[7.0].define(version: 2023_11_22_122324) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "care_instructions", force: :cascade do |t|
    t.integer "user_plant_id"
    t.text "instructions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cuttings", force: :cascade do |t|
    t.integer "user_plant_id"
    t.integer "zone_id"
    t.integer "date_cut"
    t.boolean "roots", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fertilizer_schedules", force: :cascade do |t|
    t.integer "user_plant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "type_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_plants", force: :cascade do |t|
    t.integer "user_id"
    t.integer "plant_id"
    t.integer "zone_id"
    t.integer "type_id"
    t.string "img_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.string "password_confirmation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "watering_schedules", force: :cascade do |t|
    t.integer "user_plant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "zones", force: :cascade do |t|
    t.integer "user_id"
    t.string "location_name"
    t.string "light_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
