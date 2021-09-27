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

ActiveRecord::Schema.define(version: 2021_09_27_125153) do

  create_table "characters", force: :cascade do |t|
    t.string "image"
    t.string "name"
    t.integer "age"
    t.float "weight"
    t.text "history"
    t.datetime "delete_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_characters_on_name"
  end

  create_table "characters_movies", force: :cascade do |t|
    t.integer "character_id"
    t.integer "movie_id"
    t.index ["character_id"], name: "index_characters_movies_on_character_id"
    t.index ["movie_id"], name: "index_characters_movies_on_movie_id"
  end

  create_table "genders", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "delete_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_genders_on_name"
  end

  create_table "movies", force: :cascade do |t|
    t.string "image"
    t.string "title"
    t.integer "qualification"
    t.integer "gender_id", null: false
    t.datetime "delete_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gender_id"], name: "index_movies_on_gender_id"
    t.index ["title"], name: "index_movies_on_title"
  end

  add_foreign_key "movies", "genders"
end
