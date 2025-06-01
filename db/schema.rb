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

ActiveRecord::Schema[7.1].define(version: 2025_06_01_102329) do
  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "health_point"
    t.integer "action_point"
    t.integer "movement_point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "status"
    t.integer "current_turn"
    t.datetime "timer_started_at"
    t.integer "winner_id"
    t.integer "current_player_turn_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["current_player_turn_id"], name: "index_games_on_current_player_turn_id"
    t.index ["winner_id"], name: "index_games_on_winner_id"
  end

  create_table "players", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "character_id", null: false
    t.integer "game_id", null: false
    t.integer "current_hp"
    t.integer "current_action_points"
    t.integer "current_movement_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_players_on_character_id"
    t.index ["game_id"], name: "index_players_on_game_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "games", "players", column: "current_player_turn_id"
  add_foreign_key "games", "users", column: "winner_id"
  add_foreign_key "players", "characters"
  add_foreign_key "players", "games"
  add_foreign_key "players", "users"
end
