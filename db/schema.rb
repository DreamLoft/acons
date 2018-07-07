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

ActiveRecord::Schema.define(version: 20180707131521) do

  create_table "apartment_payments", force: :cascade do |t|
    t.integer "office_deal_id"
    t.integer "amount_paid"
    t.date "payment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["office_deal_id"], name: "index_apartment_payments_on_office_deal_id"
  end

  create_table "apartments", force: :cascade do |t|
    t.string "apartment_name"
    t.string "carpet_area"
    t.string "build_up"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["project_id"], name: "index_apartments_on_project_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.string "customer_name"
    t.string "customer_email"
    t.string "customer_mobile"
    t.date "booking_date"
    t.integer "total_guests"
    t.string "booking_status"
    t.date "booked_from"
    t.date "booked_till"
    t.decimal "booking_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "paid_amount"
  end

  create_table "construction_payments", force: :cascade do |t|
    t.integer "amount_paid"
    t.date "payment_date"
    t.string "payment_mode"
    t.integer "project_id"
    t.text "payment_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "payee_id"
    t.integer "intermediary"
    t.integer "payee_category_id"
    t.index ["payee_category_id"], name: "index_construction_payments_on_payee_category_id"
    t.index ["payee_id"], name: "index_construction_payments_on_payee_id"
    t.index ["project_id"], name: "index_construction_payments_on_project_id"
  end

  create_table "construction_stock_fillings", force: :cascade do |t|
    t.integer "construction_stock_id"
    t.integer "quantity"
    t.date "filling_date"
    t.string "accepted_by"
    t.string "filling_location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["construction_stock_id"], name: "index_construction_stock_fillings_on_construction_stock_id"
  end

  create_table "construction_stock_issues", force: :cascade do |t|
    t.integer "construction_stock_id"
    t.integer "quanity"
    t.date "issue_date"
    t.string "issued_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["construction_stock_id"], name: "index_construction_stock_issues_on_construction_stock_id"
  end

  create_table "construction_stocks", force: :cascade do |t|
    t.string "item_name"
    t.integer "stock_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.text "coupon_code"
    t.text "coupon_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
  end

  create_table "guests", force: :cascade do |t|
    t.string "name"
    t.string "mobile"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "logs", force: :cascade do |t|
    t.integer "guest_id"
    t.datetime "check_in_time"
    t.datetime "check_out_time"
    t.integer "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_logs_on_booking_id"
    t.index ["guest_id"], name: "index_logs_on_guest_id"
  end

  create_table "office_customers", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.date "date_of_enquiry"
    t.string "from_where"
    t.string "looking_for"
    t.integer "budget"
    t.string "broker"
    t.string "status"
    t.text "comments"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "office_deals", force: :cascade do |t|
    t.integer "office_customer_id"
    t.integer "apartment_id"
    t.integer "base_price"
    t.integer "stamp_duty"
    t.integer "registration_charges"
    t.integer "other_charges"
    t.integer "maintenance_charges"
    t.integer "parking_charges"
    t.integer "developement_charges"
    t.integer "club_membership_charges"
    t.integer "furniture_charges"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "total_price"
    t.index ["apartment_id"], name: "index_office_deals_on_apartment_id"
    t.index ["office_customer_id"], name: "index_office_deals_on_office_customer_id"
  end

  create_table "payee_categories", force: :cascade do |t|
    t.string "category_name"
    t.string "category_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payees", force: :cascade do |t|
    t.integer "payee_category_id"
    t.string "payee_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payee_category_id"], name: "index_payees_on_payee_category_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "booking_id"
    t.decimal "amount_paid"
    t.string "payment_method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "payment_date"
    t.index ["booking_id"], name: "index_payments_on_booking_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "project_name"
    t.integer "number_of_buildings"
    t.integer "number_of_wings"
    t.integer "number_of_apartments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "room_bookings", id: false, force: :cascade do |t|
    t.integer "room_id"
    t.integer "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_room_bookings_on_booking_id"
    t.index ["room_id"], name: "index_room_bookings_on_room_id"
  end

  create_table "room_services", force: :cascade do |t|
    t.integer "stock_item_id"
    t.integer "booking_id"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
    t.integer "quantity"
    t.index ["booking_id"], name: "index_room_services_on_booking_id"
    t.index ["room_id"], name: "index_room_services_on_room_id"
    t.index ["stock_item_id"], name: "index_room_services_on_stock_item_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "room_name"
    t.string "room_type"
    t.string "room_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stock_items", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.integer "stock_item_id"
    t.date "filling_date"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stock_item_id"], name: "index_stocks_on_stock_item_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.boolean "approved", default: false, null: false
    t.string "user_type"
    t.index ["approved"], name: "index_users_on_approved"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
