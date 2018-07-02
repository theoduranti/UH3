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

ActiveRecord::Schema.define(version: 2018_07_02_092304) do

  create_table "eles", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "firstname"
    t.string "lastname"
    t.string "photo"
    t.string "description"
    t.string "passion1"
    t.string "passion2"
    t.string "passion3"
    t.string "passion4"
    t.string "ville"
    t.string "departement"
    t.index ["email"], name: "index_eles_on_email", unique: true
    t.index ["reset_password_token"], name: "index_eles_on_reset_password_token", unique: true
  end

  create_table "eles_events", id: false, force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "ele_id", null: false
    t.index ["ele_id", "event_id"], name: "index_eles_events_on_ele_id_and_event_id"
    t.index ["event_id", "ele_id"], name: "index_eles_events_on_event_id_and_ele_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "description"
    t.string "discipline"
    t.string "ville"
    t.string "departement"
    t.decimal "prix"
    t.integer "creator_id"
    t.integer "professor_id"
    t.string "etat"
    t.string "naturecreateur"
    t.string "professeur"
    t.integer "asubscribe"
    t.integer "apayer"
    t.datetime "date"
  end

  create_table "events_pros", id: false, force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "pro_id", null: false
    t.index ["event_id", "pro_id"], name: "index_events_pros_on_event_id_and_pro_id"
    t.index ["pro_id", "event_id"], name: "index_events_pros_on_pro_id_and_event_id"
  end

  create_table "pros", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "firstname"
    t.string "lastname"
    t.string "photo"
    t.string "description"
    t.string "passion1"
    t.string "passion2"
    t.string "passion3"
    t.string "passion4"
    t.string "ville"
    t.string "departement"
    t.index ["email"], name: "index_pros_on_email", unique: true
    t.index ["reset_password_token"], name: "index_pros_on_reset_password_token", unique: true
  end

end
