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

ActiveRecord::Schema[7.0].define(version: 2023_06_19_182814) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ticker_values", force: :cascade do |t|
    t.bigint "ticker_id", null: false
    t.date "date", null: false
    t.float "open"
    t.float "low"
    t.float "high"
    t.float "close"
    t.float "volume"
    t.float "value"
    t.float "capitalization"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticker_id", "date"], name: "index_ticker_values_on_ticker_id_and_date", unique: true
    t.index ["ticker_id"], name: "index_ticker_values_on_ticker_id"
  end

  create_table "tickers", force: :cascade do |t|
    t.string "symbol", null: false
    t.string "name"
    t.string "name_full"
    t.string "name_en"
    t.string "isin"
    t.integer "list_level"
    t.string "sec_type"
    t.integer "symbol_type", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["symbol"], name: "index_tickers_on_symbol", unique: true
  end

  add_foreign_key "ticker_values", "tickers"
end
