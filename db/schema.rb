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

ActiveRecord::Schema.define(version: 2022_01_24_112947) do

  create_table "admins", force: :cascade do |t|
    t.integer "user_id_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id_id"], name: "index_admins_on_user_id_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.integer "service_id_id", null: false
    t.integer "request_id_id", null: false
    t.datetime "schedule"
    t.decimal "total_charge"
    t.datetime "confirmed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["request_id_id"], name: "index_appointments_on_request_id_id"
    t.index ["service_id_id"], name: "index_appointments_on_service_id_id"
  end

  create_table "chefs", force: :cascade do |t|
    t.integer "user_id_id", null: false
    t.string "location"
    t.string "contact_number"
    t.datetime "suspended_at"
    t.text "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id_id"], name: "index_chefs_on_user_id_id"
  end

  create_table "clients", force: :cascade do |t|
    t.integer "user_id_id", null: false
    t.string "location"
    t.string "contact_number"
    t.datetime "suspended_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id_id"], name: "index_clients_on_user_id_id"
  end

  create_table "galleries", force: :cascade do |t|
    t.integer "chef_id_id", null: false
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chef_id_id"], name: "index_galleries_on_chef_id_id"
  end

  create_table "reports", force: :cascade do |t|
    t.integer "chef_id_id", null: false
    t.integer "client_id_id", null: false
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chef_id_id"], name: "index_reports_on_chef_id_id"
    t.index ["client_id_id"], name: "index_reports_on_client_id_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "client_id_id", null: false
    t.integer "head_count"
    t.string "cuisine"
    t.string "courses"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id_id"], name: "index_requests_on_client_id_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "appointment_id_id", null: false
    t.text "client_comment"
    t.decimal "chef_rating"
    t.decimal "client_rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["appointment_id_id"], name: "index_reviews_on_appointment_id_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "services", force: :cascade do |t|
    t.integer "chef_id_id", null: false
    t.text "specialty"
    t.decimal "service_rate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chef_id_id"], name: "index_services_on_chef_id_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_type"
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.integer "user_id_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id_id"], name: "index_wallets_on_user_id_id"
  end

  add_foreign_key "admins", "user_ids"
  add_foreign_key "appointments", "request_ids"
  add_foreign_key "appointments", "service_ids"
  add_foreign_key "chefs", "user_ids"
  add_foreign_key "clients", "user_ids"
  add_foreign_key "galleries", "chef_ids"
  add_foreign_key "reports", "chef_ids"
  add_foreign_key "reports", "client_ids"
  add_foreign_key "requests", "client_ids"
  add_foreign_key "reviews", "appointment_ids"
  add_foreign_key "services", "chef_ids"
  add_foreign_key "wallets", "user_ids"
end
