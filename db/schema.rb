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

ActiveRecord::Schema.define(version: 20150530184126) do

  create_table "boards", force: :cascade do |t|
    t.string   "fen"
    t.integer  "move_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "boards", ["move_id"], name: "index_boards_on_move_id"

  create_table "charges", force: :cascade do |t|
    t.string   "description"
    t.integer  "user_id"
    t.integer  "vendor_id"
    t.string   "token"
    t.string   "customer_id"
    t.boolean  "completed",   default: false
    t.integer  "price"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "request_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer  "player1_id"
    t.integer  "player2_id"
    t.integer  "invitation_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "games", ["invitation_id"], name: "index_games_on_invitation_id"

  create_table "invitations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "learners", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mentors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.integer  "conversation_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "read",            default: false
    t.string   "avatar_url"
    t.string   "created_time"
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id"

  create_table "moves", force: :cascade do |t|
    t.string   "notation"
    t.string   "piece"
    t.integer  "room_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "game_id"
  end

  add_index "moves", ["room_id"], name: "index_moves_on_room_id"

  create_table "requests", force: :cascade do |t|
    t.text     "body"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.boolean  "seen",         default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "time"
    t.string   "stripe"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",        null: false
    t.string   "encrypted_password",     default: "",        null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "remote_avatar"
    t.boolean  "mentor",                 default: false
    t.string   "city"
    t.string   "country"
    t.integer  "official_ranking"
    t.integer  "user_ranking",           default: 0
    t.integer  "price"
    t.string   "provider"
    t.string   "uid"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "type",                   default: "Learner"
    t.string   "publishable_key"
    t.string   "access_code"
    t.string   "stripe_user_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
