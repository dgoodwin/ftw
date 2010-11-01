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

ActiveRecord::Schema.define(:version => 20101031142214) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "platform_id"
    t.boolean  "verified",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "can_host",    :default => 0
  end

  create_table "events", :force => true do |t|
    t.datetime "time"
    t.integer  "season_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",         :limit => 50
    t.text     "instructions"
    t.integer  "track_id"
    t.integer  "tire_id"
    t.integer  "weather_id"
    t.integer  "pp"
  end

  create_table "games", :force => true do |t|
    t.string   "key"
    t.string   "name"
    t.integer  "platform_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "host_volunteers", :force => true do |t|
    t.integer  "race_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leagues", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "game_id"
    t.string   "racing_type", :limit => 50
    t.string   "membership",  :limit => 50
    t.string   "skill_level", :limit => 20
  end

  create_table "members", :force => true do |t|
    t.integer  "league_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
  end

  create_table "permissions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "qualifier"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",       :limit => 50
  end

  create_table "platforms", :force => true do |t|
    t.string   "key"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "race_result_rows", :force => true do |t|
    t.integer  "position"
    t.string   "time",           :limit => 15
    t.integer  "user_id"
    t.integer  "race_result_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",         :limit => 50, :default => "finished"
    t.integer  "millis"
  end

  create_table "race_results", :force => true do |t|
    t.integer  "race_id"
    t.integer  "user_id"
    t.boolean  "final"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "races", :force => true do |t|
    t.datetime "time"
    t.integer  "event_id"
    t.string   "password"
    t.integer  "users_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "index"
    t.integer  "host_id"
  end

  create_table "races_users", :id => false, :force => true do |t|
    t.integer "race_id"
    t.integer "user_id"
  end

  create_table "registrants", :force => true do |t|
    t.integer  "event_id"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", :force => true do |t|
    t.integer  "user_id"
    t.integer  "league_id"
    t.datetime "time"
    t.string   "comments"
    t.string   "request_type"
    t.integer  "entity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rights_roles", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "right_id"
  end

  create_table "seasons", :force => true do |t|
    t.string   "name"
    t.integer  "league_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "start_date"
    t.date     "end_date"
  end

  create_table "tires", :force => true do |t|
    t.integer  "game_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tracks", :force => true do |t|
    t.integer  "game_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "name"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "weathers", :force => true do |t|
    t.integer  "game_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
