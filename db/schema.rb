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

ActiveRecord::Schema.define(:version => 20130527102402) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "pid",        :default => 0
    t.boolean  "ctype",      :default => true
    t.text     "desc"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "categories", ["slug"], :name => "category_slug"

  create_table "positions", :force => true do |t|
    t.string   "title"
    t.boolean  "location",   :default => false,                   :null => false
    t.string   "image"
    t.string   "url",        :default => "http://www.seearm.com"
    t.text     "desc"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  add_index "positions", ["location"], :name => "location"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "pictures"
    t.integer  "category_id"
    t.decimal  "price",        :precision => 10, :scale => 0
    t.boolean  "status",                                      :default => false
    t.string   "taobao_url",                                  :default => "http://seearm.taobao.com"
    t.string   "keywords"
    t.text     "content"
    t.text     "content_html"
    t.datetime "created_at",                                                                          :null => false
    t.datetime "updated_at",                                                                          :null => false
  end

  add_index "products", ["category_id"], :name => "product_category"

  create_table "upload_files", :force => true do |t|
    t.string   "file_name"
    t.integer  "file_size"
    t.integer  "user_id"
    t.boolean  "type",       :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "password_salt",          :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
