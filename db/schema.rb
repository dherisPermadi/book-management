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

ActiveRecord::Schema[7.0].define(version: 2022_11_15_024655) do
  create_table "authors", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.integer "n_books"
    t.text "summary"
    t.datetime "born"
    t.datetime "died"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "author_id"
    t.string "content_name"
    t.string "author_name"
    t.string "year"
    t.string "category"
    t.json "genres"
    t.json "title"
    t.float "average_rating"
    t.integer "pages"
    t.text "description"
    t.string "language"
    t.datetime "release_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_books_on_author_id"
  end

end
