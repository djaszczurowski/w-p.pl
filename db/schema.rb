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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110327190146) do

  create_table "categories", :force => true do |t|
    t.string   "polishName"
    t.string   "polishDescription"
    t.string   "englishName"
    t.string   "englishDescription"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "commentaries", :force => true do |t|
    t.integer  "user_id"
    t.integer  "news_id"
    t.date     "posted"
    t.string   "subject"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", :force => true do |t|
    t.integer  "user_id"
    t.datetime "posted"
    t.integer  "category_id"
    t.string   "polish_subject"
    t.string   "polish_news"
    t.string   "english_subject"
    t.string   "english_news"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "postulates", :force => true do |t|
    t.integer  "user_id"
    t.string   "uniform_link"
    t.string   "commentary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.integer  "privileges_level"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
