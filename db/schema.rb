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

ActiveRecord::Schema[8.1].define(version: 2026_09_21_050945) do
  create_table "accounts", force: :cascade do |t|
    t.string "acc_code", limit: 10
    t.datetime "created_at", null: false
    t.text "description", limit: 500
    t.string "image_url", limit: 255
    t.string "name"
    t.string "short_description", limit: 150
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.integer "account_id", null: false
    t.text "body"
    t.datetime "created_at", null: false
    t.text "footer"
    t.integer "nstatus"
    t.datetime "publishedat"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_notes_on_account_id"
  end

  create_table "user_notes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "note_id", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["note_id"], name: "index_user_notes_on_note_id"
    t.index ["user_id"], name: "index_user_notes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "account_id", null: false
    t.integer "age"
    t.string "avatarurl"
    t.datetime "created_at", null: false
    t.string "email", limit: 100
    t.string "mobile"
    t.string "name"
    t.string "tagline"
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_users_on_account_id"
    t.index ["email", "account_id"], name: "idx_email_account"
  end

  add_foreign_key "notes", "accounts"
  add_foreign_key "user_notes", "notes"
  add_foreign_key "user_notes", "users"
  add_foreign_key "users", "accounts"
end
