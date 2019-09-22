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

ActiveRecord::Schema.define(version: 2019_09_22_162753) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "short_urls", force: :cascade do |t|
    t.string "short_url", null: false
    t.string "long_url", null: false
    t.integer "submit_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["short_url"], name: "index_short_urls_on_short_url", unique: true
    t.index ["submit_user_id"], name: "index_short_urls_on_submit_user_id"
  end

  create_table "shortened_urls", force: :cascade do |t|
    t.string "short_url"
    t.string "long_url", null: false
    t.integer "user_id", null: false
    t.index ["short_url"], name: "index_shortened_urls_on_short_url", unique: true
    t.index ["user_id"], name: "index_shortened_urls_on_user_id"
  end

  create_table "tag_topics", force: :cascade do |t|
    t.string "topic", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "url_id", null: false
    t.integer "tag_topic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_topic_id"], name: "index_taggings_on_tag_topic_id"
    t.index ["url_id"], name: "index_taggings_on_url_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "visits", force: :cascade do |t|
    t.string "shortened_url", null: false
    t.integer "visitor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shortened_url"], name: "index_visits_on_shortened_url"
    t.index ["visitor_id"], name: "index_visits_on_visitor_id"
  end

end
