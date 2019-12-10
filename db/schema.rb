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

ActiveRecord::Schema.define(version: 2019_12_02_223200) do

  create_table "authors", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_names", null: false
    t.date "date_born"
    t.date "date_dead"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_name"], name: "index_authors_on_first_name_and_last_name", unique: true
  end

  create_table "book_details", force: :cascade do |t|
    t.string "edition"
    t.string "isbn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "book_id"
    t.index ["book_id"], name: "index_book_details_on_book_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "book_name", null: false
    t.boolean "in_series", null: false
    t.integer "seq_in_series"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "author_id"
    t.integer "genre_id"
    t.index ["author_id"], name: "index_books_on_author_id"
    t.index ["book_name"], name: "index_books_on_book_name"
    t.index ["genre_id"], name: "index_books_on_genre_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content", null: false
    t.datetime "date_created", null: false
    t.datetime "date_modified"
    t.boolean "deleted", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "forum_post_id"
    t.integer "user_id"
    t.index ["forum_post_id"], name: "index_comments_on_forum_post_id"
    t.index ["id", "user_id"], name: "index_comments_on_id_and_user_id_and_post_id", unique: true
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "forum_posts", force: :cascade do |t|
    t.text "content"
    t.datetime "date_created", null: false
    t.datetime "last_modified"
    t.boolean "deleted", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title", null: false
    t.integer "user_id"
    t.index ["deleted"], name: "index_forum_posts_on_deleted"
    t.index ["id", "title"], name: "index_forum_posts_on_id_and_title", unique: true
    t.index ["title"], name: "index_forum_posts_on_title"
    t.index ["user_id"], name: "index_forum_posts_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_genres_on_name", unique: true
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

end
