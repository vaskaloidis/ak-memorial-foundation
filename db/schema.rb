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

ActiveRecord::Schema.define(version: 20180530232020) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invites", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "golfer_number"
    t.string "email"
    t.datetime "sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["user_id"], name: "index_invites_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "category"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "user_id"
    t.integer "product_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "amount"
    t.boolean "display"
    t.integer "payment_type"
    t.index ["product_id"], name: "index_purchases_on_product_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id"
    t.decimal "amount"
    t.index ["product_id"], name: "index_shopping_carts_on_product_id"
    t.index ["user_id"], name: "index_shopping_carts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "company_name"
    t.string "company_website"
    t.string "company_published_name"
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "name"
    t.string "phone"
    t.string "fax"
    t.string "note"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "golfer2_name"
    t.string "golfer2_email"
    t.string "golfer3_name"
    t.string "golfer3_email"
    t.string "golfer4_email"
    t.string "golfer4_name"
    t.boolean "admin", default: false
    t.boolean "force_password_change", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "invites", "users"
  add_foreign_key "purchases", "products"
  add_foreign_key "purchases", "users"
  add_foreign_key "shopping_carts", "products"
  add_foreign_key "shopping_carts", "users"
end
