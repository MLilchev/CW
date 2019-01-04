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

ActiveRecord::Schema.define(version: 2018_12_15_021046) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.integer "year"
    t.integer "isbn"
    t.string "region"
    t.float "rating"
    t.float "price"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active"
  end

  create_table "clashes", force: :cascade do |t|
    t.integer "conflict_id"
    t.string "conflict_name"
    t.string "dyad_name"
    t.string "side_a"
    t.string "side_b"
    t.string "source_article"
    t.string "source_office"
    t.string "source_date"
    t.string "source_headline"
    t.string "source_original"
    t.string "location"
    t.float "lat"
    t.float "lon"
    t.string "country"
    t.string "region"
    t.string "date_start"
    t.string "date_end"
    t.integer "deaths_a"
    t.integer "deaths_b"
    t.integer "deaths_unknown"
    t.integer "total_deaths"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conflict_id"], name: "index_clashes_on_conflict_id"
  end

  create_table "conflicts", force: :cascade do |t|
    t.integer "conflict_new_id"
    t.string "conflict_name"
    t.string "country"
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_conflicts_on_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "country"
    t.string "country_formal"
    t.integer "population"
    t.integer "gdp"
    t.string "economy_type"
    t.string "income_level"
    t.string "region"
    t.float "lon"
    t.float "lat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "episodes", force: :cascade do |t|
    t.integer "episode"
    t.integer "fip"
    t.text "narrative"
    t.integer "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_episodes_on_state_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer "event"
    t.integer "begin_ym"
    t.integer "begin_day"
    t.integer "begin_time"
    t.integer "end_ym"
    t.integer "end_day"
    t.integer "end_time"
    t.integer "year"
    t.string "month"
    t.string "begin_dt"
    t.string "end_dt"
    t.string "damage"
    t.string "tor_f_scale"
    t.float "tor_length"
    t.integer "tor_width"
    t.string "begin_loc"
    t.string "end_loc"
    t.float "begin_lat"
    t.float "end_lat"
    t.float "begin_lon"
    t.float "end_lon"
    t.text "narrative"
    t.integer "episode_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "episode"
    t.index ["episode_id"], name: "index_events_on_episode_id"
  end

  create_table "geodata", force: :cascade do |t|
    t.integer "EVENT_ID"
    t.string "STATE"
    t.integer "STATE_FIPS"
    t.string "BEGIN_LOCATION"
    t.string "END_LOCATION"
    t.float "BEGIN_LAT"
    t.float "BEGIN_LON"
    t.float "END_LAT"
    t.float "END_LON"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "order_id"
    t.decimal "unit_price", precision: 12, scale: 3
    t.integer "quantity"
    t.decimal "total_price", precision: 12, scale: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_order_items_on_book_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "subtotal", precision: 12, scale: 3
    t.decimal "tax", precision: 12, scale: 3
    t.decimal "shipping", precision: 12, scale: 3
    t.decimal "total", precision: 12, scale: 3
    t.bigint "order_status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_status_id"], name: "index_orders_on_order_status_id"
  end

  create_table "states", force: :cascade do |t|
    t.integer "fip"
    t.string "name"
    t.string "code"
    t.float "lat"
    t.float "lon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "crypted_password"
    t.string "password_salt"
    t.string "persistence_token"
    t.string "first_name"
    t.string "last_name"
    t.string "dob"
    t.string "street"
    t.string "city"
    t.string "card_type"
    t.string "card_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "login_count", default: 0, null: false
    t.integer "failed_login_count", default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string "current_login_ip"
    t.string "last_login_ip"
    t.string "perishable_token"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "order_items", "books"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "order_statuses"
end
