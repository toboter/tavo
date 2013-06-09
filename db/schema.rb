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

ActiveRecord::Schema.define(:version => 20130602180704) do

  create_table "appellations", :force => true do |t|
    t.integer  "site_id"
    t.string   "content"
    t.string   "period"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "citations", :force => true do |t|
    t.integer  "reference_id"
    t.string   "target"
    t.integer  "citable_id"
    t.string   "citable_type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "districts", :force => true do |t|
    t.string   "name"
    t.string   "country"
    t.string   "museum_address"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "documents", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "documenttype"
    t.integer  "documentable_id"
    t.string   "documentable_type"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "author_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "images", :force => true do |t|
    t.text     "description"
    t.string   "imagefile"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "imagetype"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.integer  "author_id"
    t.date     "original_date"
    t.string   "name"
  end

  create_table "imagetags", :force => true do |t|
    t.integer  "image_id"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "memberships", :force => true do |t|
    t.integer  "project_id"
    t.integer  "person_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.string   "task"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "fax"
    t.text     "address"
    t.text     "info"
    t.text     "vitae"
    t.string   "public_email"
    t.string   "slug"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "people", ["slug"], :name => "index_people_on_slug", :unique => true

  create_table "people_references", :id => false, :force => true do |t|
    t.integer "person_id"
    t.integer "reference_id"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.text     "description"
    t.text     "method"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.integer  "responsible_id"
  end

  create_table "references", :force => true do |t|
    t.string   "title"
    t.date     "year"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.string   "publishing_place"
    t.string   "ancestry"
    t.string   "first_page"
    t.string   "last_page"
    t.string   "referencetype"
    t.string   "alternative_author"
    t.string   "volume_number"
  end

  add_index "references", ["ancestry"], :name => "index_references_on_ancestry"

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.integer  "district_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
  end

  create_table "surveys", :force => true do |t|
    t.integer  "project_id"
    t.string   "number"
    t.integer  "site_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "users", :force => true do |t|
    t.string   "username",                        :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.boolean  "activated"
    t.string   "role"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token"

  create_table "visits", :force => true do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "survey_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

end
