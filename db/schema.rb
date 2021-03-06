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

ActiveRecord::Schema.define(version: 20171119055407) do

  create_table "bookings", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "length"
    t.integer "garage_spot_id"
    t.integer "user_id"
    t.index ["garage_spot_id"], name: "index_bookings_on_garage_spot_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "charges", force: :cascade do |t|
    t.integer "booking_id"
    t.float "amount"
    t.string "token"
    t.boolean "paid", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_charges_on_booking_id"
  end

  create_table "garage_spots", force: :cascade do |t|
    t.integer "garage_id"
    t.integer "spot_id"
    t.string "serial"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garage_id"], name: "index_garage_spots_on_garage_id"
    t.index ["serial"], name: "index_garage_spots_on_serial", unique: true
    t.index ["spot_id"], name: "index_garage_spots_on_spot_id"
  end

  create_table "garages", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.float "weekday"
    t.float "weekend"
    t.string "email", default: "", null: false
    t.boolean "notify", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_garages_on_email", unique: true
  end

  create_table "licenseplates", force: :cascade do |t|
    t.string "license_plate"
    t.string "make"
    t.integer "year"
    t.string "color"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["license_plate"], name: "index_licenseplates_on_license_plate", unique: true
    t.index ["user_id"], name: "index_licenseplates_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "recipient_id"
    t.integer "booking_id"
    t.float "confidence"
    t.string "action"
    t.datetime "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_notifications_on_booking_id"
  end

  create_table "spots", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.bigint "phone"
    t.boolean "admin", default: false, null: false
    t.integer "garage_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["garage_id"], name: "index_users_on_garage_id"
  end

end
