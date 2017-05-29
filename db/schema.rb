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


ActiveRecord::Schema.define(version: 20170527213505) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "comment_text", null: false
    t.date     "comment_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.integer  "proyect_id"
    t.index ["proyect_id"], name: "index_comments_on_proyect_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "donations", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "user_id"
    t.integer  "proyect_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "proyect_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proyect_id"], name: "index_likes_on_proyect_id", using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "proyects", force: :cascade do |t|
    t.string   "name",         null: false
    t.text     "description"
    t.date     "initial_date", null: false
    t.date     "due_date",     null: false
    t.integer  "actual_money", null: false
    t.integer  "goal_money",   null: false
    t.integer  "score",        null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "category_id"
    t.integer  "user_id"
    t.index ["category_id"], name: "index_proyects_on_category_id", using: :btree
    t.index ["user_id"], name: "index_proyects_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",                        null: false
    t.string   "mail",                            null: false
    t.string   "type"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "password_digest"
    t.boolean  "admin"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"

  end

  add_foreign_key "proyects", "users"
end
