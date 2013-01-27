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

ActiveRecord::Schema.define(:version => 20130127201156) do

  create_table "bowel_movements", :force => true do |t|
    t.integer  "child_id"
    t.datetime "bowel_time"
    t.string   "consistency"
    t.string   "color"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "bowel_movements", ["child_id"], :name => "index_bowel_movements_on_child_id"

  create_table "children", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "birth_month"
    t.integer  "birth_year"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "children", ["user_id"], :name => "index_children_on_user_id"

  create_table "dosages", :force => true do |t|
    t.boolean  "annual",     :default => false
    t.integer  "vaccine_id"
    t.integer  "min_age"
    t.integer  "max_age"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "dosages", ["max_age"], :name => "index_dosages_on_max_age"
  add_index "dosages", ["min_age"], :name => "index_dosages_on_min_age"
  add_index "dosages", ["vaccine_id"], :name => "index_dosages_on_vaccine_id"

  create_table "dr_visit_shots", :force => true do |t|
    t.integer  "dr_visit_id"
    t.integer  "dosage_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "dr_visit_shots", ["dosage_id"], :name => "index_dr_visit_shots_on_dosage_id"
  add_index "dr_visit_shots", ["dr_visit_id"], :name => "index_dr_visit_shots_on_dr_visit_id"

  create_table "dr_visits", :force => true do |t|
    t.integer  "child_id"
    t.date     "appointment"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "dr_visits", ["appointment"], :name => "index_dr_visits_on_appointment"
  add_index "dr_visits", ["child_id"], :name => "index_dr_visits_on_child_id"

  create_table "feedings", :force => true do |t|
    t.integer  "child_id"
    t.datetime "feeding_time"
    t.decimal  "amount",                     :precision => 4, :scale => 2
    t.string   "unit",         :limit => 64
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
  end

  add_index "feedings", ["child_id"], :name => "index_feedings_on_child_id"

  create_table "notes", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "noteable_id"
    t.string   "noteable_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "notes", ["noteable_id", "noteable_type"], :name => "index_notes_on_noteable_id_and_noteable_type"
  add_index "notes", ["user_id"], :name => "index_notes_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "time_zone",              :default => "Eastern Time (US & Canada)"
    t.string   "role"
    t.datetime "created_at",                                                       :null => false
    t.datetime "updated_at",                                                       :null => false
    t.string   "email",                  :default => "",                           :null => false
    t.string   "encrypted_password",     :default => "",                           :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["role"], :name => "index_users_on_role"

  create_table "vaccines", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
