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

ActiveRecord::Schema.define(version: 2019_11_21_101428) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "books", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "author"
    t.integer "publishing_year"
    t.float "rating"
    t.bigint "category_id"
    t.string "image"
    t.bigint "user_id"
    t.bigint "reading_list_id"
    t.bigint "domain_id"
    t.boolean "wishlist"
    t.index ["category_id"], name: "index_books_on_category_id"
    t.index ["domain_id"], name: "index_books_on_domain_id"
    t.index ["reading_list_id"], name: "index_books_on_reading_list_id"
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "class_notes", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.integer "click_counter"
    t.bigint "user_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["course_id"], name: "index_class_notes_on_course_id"
    t.index ["user_id"], name: "index_class_notes_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.bigint "domain_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["domain_id"], name: "index_courses_on_domain_id"
  end

  create_table "domains", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "note_ratings", force: :cascade do |t|
    t.float "value"
    t.bigint "class_note_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_note_id"], name: "index_note_ratings_on_class_note_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "book_id"
    t.float "rating"
    t.index ["book_id"], name: "index_ratings_on_book_id"
  end

  create_table "reading_lists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "readings", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_readings_on_book_id"
    t.index ["user_id"], name: "index_readings_on_user_id"
  end

  create_table "registrations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_registrations_on_course_id"
    t.index ["user_id"], name: "index_registrations_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_reviews_on_book_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "savings", force: :cascade do |t|
    t.bigint "class_note_id"
    t.bigint "wishlist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_note_id"], name: "index_savings_on_class_note_id"
    t.index ["wishlist_id"], name: "index_savings_on_wishlist_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.boolean "admin"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wishlists", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "books", "categories"
  add_foreign_key "books", "reading_lists"
  add_foreign_key "books", "users"
  add_foreign_key "class_notes", "courses"
  add_foreign_key "class_notes", "users"
  add_foreign_key "courses", "domains"
  add_foreign_key "note_ratings", "class_notes"
  add_foreign_key "ratings", "books"
  add_foreign_key "readings", "books"
  add_foreign_key "readings", "users"
  add_foreign_key "registrations", "courses"
  add_foreign_key "registrations", "users"
  add_foreign_key "reviews", "books"
  add_foreign_key "savings", "class_notes"
  add_foreign_key "savings", "wishlists"
  add_foreign_key "wishlists", "users"
end
