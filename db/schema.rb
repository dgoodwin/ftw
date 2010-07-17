# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100717232308) do

  create_table "events", :force => true do |t|
    t.datetime "time"
    t.integer  "season_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",       :limit => 50
  end

  create_table "leagues", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", :force => true do |t|
    t.integer  "league_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "races", :force => true do |t|
    t.datetime "time"
    t.integer  "event_id"
    t.text     "instructions"
    t.string   "password"
    t.integer  "users_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "index"
  end

  create_table "races_users", :id => false, :force => true do |t|
    t.integer "race_id"
    t.integer "user_id"
  end

  create_table "seasons", :force => true do |t|
    t.string   "name"
    t.integer  "league_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "hashed_password"
    t.string   "name"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
