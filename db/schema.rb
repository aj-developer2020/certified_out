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

ActiveRecord::Schema.define(version: 2019_11_16_235100) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "block_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["block_id"], name: "index_attendances_on_block_id"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "blocks", force: :cascade do |t|
    t.date "date"
    t.integer "duration"
    t.string "type_of_block"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "cohort_id"
    t.bigint "user_id"
    t.index ["cohort_id"], name: "index_blocks_on_cohort_id"
    t.index ["user_id"], name: "index_blocks_on_user_id"
  end

  create_table "cohorts", force: :cascade do |t|
    t.string "title"
    t.text "slack"
    t.text "description"
    t.text "picture_url"
    t.integer "status"
    t.string "program"
    t.boolean "is_archived"
    t.date "start_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_cohorts_on_user_id"
  end

  create_table "registrations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "cohort_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cohort_id"], name: "index_registrations_on_cohort_id"
    t.index ["user_id"], name: "index_registrations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "role"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.text "picture_url"
    t.string "phone"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "attendances", "blocks"
  add_foreign_key "attendances", "users"
  add_foreign_key "blocks", "cohorts"
  add_foreign_key "blocks", "users"
  add_foreign_key "cohorts", "users"
  add_foreign_key "registrations", "cohorts"
  add_foreign_key "registrations", "users"
end
