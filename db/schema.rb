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

ActiveRecord::Schema.define(version: 2020_06_17_151336) do

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "map_id"
    t.text "name"
    t.index ["map_id"], name: "index_games_on_map_id"
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "maps", force: :cascade do |t|
    t.string "name"
    t.integer "columns"
    t.integer "rows"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ships", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "map_id"
    t.integer "type_id"
    t.integer "posX"
    t.integer "posY"
    t.text "orientation"
    t.integer "user_id"
    t.index ["map_id"], name: "index_ships_on_map_id"
    t.index ["user_id"], name: "index_ships_on_user_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.integer "large"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "phone_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "games", "maps"
  add_foreign_key "games", "users"
  add_foreign_key "ships", "maps"
  add_foreign_key "ships", "types"
  add_foreign_key "ships", "users"
end
