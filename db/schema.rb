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

ActiveRecord::Schema[8.1].define(version: 2026_05_02_134715) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "card_factions", force: :cascade do |t|
    t.bigint "card_id", null: false
    t.datetime "created_at", null: false
    t.bigint "faction_id", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_card_factions_on_card_id"
    t.index ["faction_id"], name: "index_card_factions_on_faction_id"
  end

  create_table "cards", force: :cascade do |t|
    t.integer "action", default: 0, null: false
    t.datetime "created_at", null: false
    t.text "description", null: false
    t.integer "faction", default: 0, null: false
    t.string "name", null: false
    t.integer "rarity", default: 0, null: false
    t.integer "strength", default: 0, null: false
    t.datetime "updated_at", null: false
  end

  create_table "deck_cards", force: :cascade do |t|
    t.bigint "card_id", null: false
    t.integer "count", default: 0, null: false
    t.datetime "created_at", null: false
    t.bigint "deck_id", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_deck_cards_on_card_id"
    t.index ["deck_id"], name: "index_deck_cards_on_deck_id"
  end

  create_table "decks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_decks_on_user_id"
  end

  create_table "factions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "card_factions", "cards"
  add_foreign_key "card_factions", "factions"
  add_foreign_key "deck_cards", "cards"
  add_foreign_key "deck_cards", "decks"
  add_foreign_key "decks", "users"
end
