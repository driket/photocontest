# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20131118135653) do

  create_table "contests", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "date_start"
    t.datetime "date_end"
    t.integer  "max_photos_per_user"
    t.integer  "max_vote_per_user"
    t.datetime "vote_start"
    t.datetime "vote_end"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.string   "action_title",        :default => "participer"
    t.string   "description"
    t.string   "vote_action_title"
  end

  create_table "photos", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "user_uid"
    t.integer  "contest_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "votes", :force => true do |t|
    t.string   "user_uid"
    t.integer  "photo_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "votes", ["photo_id"], :name => "index_votes_on_photo_id"

end
