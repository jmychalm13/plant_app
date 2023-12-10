ActiveRecord::Schema[7.0].define(version: 2023_12_10_213711) do
  enable_extension "plpgsql"

  create_table "care_instructions", force: :cascade do |t|
    t.integer "user_plant_id"
    t.text "instructions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "img"
  end

  create_table "cuttings", force: :cascade do |t|
    t.integer "user_plant_id"
    t.integer "zone_id"
    t.boolean "roots", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date_cut"
  end

  create_table "fertilizer_schedules", force: :cascade do |t|
    t.integer "user_plant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "schedule"
  end

  create_table "types", force: :cascade do |t|
    t.string "type_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_plants", force: :cascade do |t|
    t.integer "user_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "watering_schedules", force: :cascade do |t|
    t.integer "user_plant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "schedule"
  end

  create_table "zones", force: :cascade do |t|
    t.integer "user_id"
    t.string "location_name"
    t.string "light_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
