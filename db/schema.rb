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

ActiveRecord::Schema.define(version: 2021_06_06_221037) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "films", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title", null: false
    t.text "opening_crawl", null: false
    t.string "director", null: false
    t.string "producer", null: false
    t.datetime "release_date", null: false
    t.string "imdb_url", null: false
    t.text "facts", default: [], null: false, array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "films_starships", id: false, force: :cascade do |t|
    t.uuid "film_id", null: false
    t.uuid "starship_id", null: false
  end

  create_table "starships", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "model", null: false
    t.float "mglt", null: false
    t.integer "cargo_capacity", null: false
    t.string "consumables", null: false
    t.integer "cost_in_credits", null: false
    t.integer "crew", null: false
    t.float "hyperdrive_rating", null: false
    t.float "length", null: false
    t.string "manufacturer", null: false
    t.float "max_atmospheric_speed", null: false
    t.integer "passengers", null: false
    t.string "starship_class", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
