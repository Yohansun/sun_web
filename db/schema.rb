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

ActiveRecord::Schema.define(:version => 20120411071156) do

  create_table "admin_profiles", :force => true do |t|
    t.integer  "admin_id"
    t.string   "name"
    t.integer  "login_times"
    t.string   "last_login_ip"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "alipay_account"
    t.string   "mobile"
    t.string   "phone"
    t.string   "address"
  end

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
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
    t.integer  "is_locked"
    t.datetime "last_logout_at"
    t.string   "username"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "admins_functions", :force => true do |t|
    t.integer  "admin_id"
    t.integer  "function_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "admins_groups", :force => true do |t|
    t.integer  "admin_id"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "approves", :force => true do |t|
    t.string   "name"
    t.integer  "id_type"
    t.string   "id_number"
    t.string   "telphone"
    t.string   "email"
    t.string   "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "areas", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.boolean  "active",         :default => true
    t.string   "pinyin"
    t.integer  "children_count", :default => 0
    t.integer  "lft",            :default => 0
    t.integer  "rgt",            :default => 0
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "avatars", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "banners", :force => true do |t|
    t.string   "position"
    t.string   "desc"
    t.string   "key"
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
    t.string   "media_type"
    t.string   "media_format"
    t.integer  "width"
    t.integer  "height"
    t.integer  "maximum_size"
    t.boolean  "enabled"
    t.boolean  "require_approve"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "color_codes", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "rgb"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "color_designs", :force => true do |t|
    t.string   "design_name"
    t.string   "design_style"
    t.string   "design_color"
    t.string   "design_usage"
    t.integer  "subject_id"
    t.datetime "published_at"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.string   "main_preview_img_file_name"
    t.string   "main_preview_img_content_type"
    t.integer  "main_preview_img_file_size"
    t.datetime "main_preview_img_updated_at"
    t.integer  "votes_count",                   :default => 0
    t.integer  "shares_count",                  :default => 0
    t.integer  "comments_count",                :default => 0
    t.string   "show_preview_img_file_name"
    t.string   "show_preview_img_content_type"
    t.integer  "show_preview_img_file_size"
    t.datetime "show_preview_img_updated_at"
    t.string   "recommend_color"
    t.text     "design_thought"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.string   "content"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "commentable_id"
    t.string   "commentable_type"
  end

  create_table "design_images", :force => true do |t|
    t.integer  "user_id"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.boolean  "is_cover"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "designs", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "votes_count",  :default => 0
    t.integer  "shares_count", :default => 0
    t.string   "style"
    t.string   "room_type"
    t.string   "city"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "area_id"
  end

  create_table "downloads", :force => true do |t|
    t.string   "title"
    t.integer  "subject_id"
    t.string   "preview_img_file_name"
    t.string   "preview_img_content_type"
    t.integer  "preview_img_file_size"
    t.datetime "preview_img_updated_at"
    t.string   "detail_img_file_name"
    t.string   "detail_img_content_type"
    t.integer  "detail_img_file_size"
    t.datetime "detail_img_updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.datetime "published_at"
  end

  create_table "events", :force => true do |t|
    t.text     "title"
    t.string   "event_img_file_name"
    t.string   "event_img_content_type"
    t.integer  "event_img_file_size"
    t.datetime "event_img_updated_at"
    t.date     "begin_at"
    t.date     "end_at"
    t.string   "begin_time"
    t.string   "end_time"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "faqs", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
  end

  create_table "function_categories", :force => true do |t|
    t.string   "name"
    t.integer  "function_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "functions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "function_category_id"
  end

  create_table "functions_permissions", :force => true do |t|
    t.integer  "function_id"
    t.integer  "permission_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "groups", :force => true do |t|
    t.integer  "admin_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "is_locked"
  end

  create_table "groups_functions", :force => true do |t|
    t.integer  "group_id"
    t.integer  "function_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "inspirations", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "votes_count",      :default => 0
    t.integer  "shares_count",     :default => 0
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "jobs", :force => true do |t|
    t.string   "job"
    t.string   "local"
    t.string   "company"
    t.string   "department"
    t.string   "edu_bg"
    t.integer  "number"
    t.datetime "begin_time"
    t.datetime "stop_time"
    t.string   "email"
    t.text     "descript"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "subject_id"
    t.string   "work_experience"
  end

  create_table "maillists", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "master_design_uploads", :force => true do |t|
    t.integer  "master_design_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "master_designs", :force => true do |t|
    t.integer  "master_profile_id"
    t.string   "design_name"
    t.text     "design_intro"
    t.integer  "subject_id"
    t.datetime "published_at"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "main_preview_img_file_name"
    t.string   "main_preview_img_content_type"
    t.integer  "main_preview_img_file_size"
    t.datetime "main_preview_img_updated_at"
  end

  create_table "master_profiles", :force => true do |t|
    t.string   "name"
    t.string   "nationality"
    t.string   "master_field"
    t.text     "position"
    t.text     "interview_content"
    t.text     "message"
    t.string   "title"
    t.text     "intro"
    t.integer  "subject_id"
    t.datetime "published_at"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "preview_img_out_file_name"
    t.string   "preview_img_out_content_type"
    t.integer  "preview_img_out_file_size"
    t.datetime "preview_img_out_updated_at"
    t.string   "preview_img_in_file_name"
    t.string   "preview_img_in_content_type"
    t.integer  "preview_img_in_file_size"
    t.datetime "preview_img_in_updated_at"
    t.string   "master_kind"
    t.string   "interview_content_type"
  end

  create_table "master_videos", :force => true do |t|
    t.string   "py"
    t.string   "name"
    t.text     "intro"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "from_user_id"
    t.text     "content"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "mix_colors", :force => true do |t|
    t.text     "description"
    t.string   "mix_color_img_file_name"
    t.string   "mix_color_img_content_type"
    t.integer  "mix_color_img_file_size"
    t.datetime "mix_color_img_updated_at"
    t.integer  "user_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "intro"
    t.text     "content"
    t.integer  "admin_id"
    t.integer  "subject_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.datetime "published_at"
  end

  create_table "permissions", :force => true do |t|
    t.string   "name"
    t.string   "action"
    t.string   "subject_class"
    t.integer  "subject_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "can",           :default => 1
    t.integer  "function_id"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "intro"
    t.text     "body"
    t.integer  "admin_id"
    t.integer  "subject_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.datetime "published_at"
    t.string   "preview_img_file_name"
    t.string   "preview_img_content_type"
    t.integer  "preview_img_file_size"
    t.datetime "preview_img_updated_at"
    t.string   "content_source"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "intro"
    t.text     "content"
    t.integer  "subject_id"
    t.datetime "published_at"
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "role"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "settings", :force => true do |t|
    t.string   "var",                      :null => false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", :limit => 30
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "settings", ["thing_type", "thing_id", "var"], :name => "index_settings_on_thing_type_and_thing_id_and_var", :unique => true

  create_table "site_messages", :force => true do |t|
    t.text     "desc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.string   "title"
  end

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "content_type"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "upload_files", :force => true do |t|
    t.string   "filedata_file_name"
    t.string   "filedata_content_type"
    t.integer  "filedata_file_size"
    t.datetime "filedata_updated_at"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "user_tokens", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",   :null => false
    t.string   "encrypted_password",     :default => "",   :null => false
    t.integer  "role_id"
    t.string   "username"
    t.boolean  "des_status",             :default => true
    t.string   "inauguration_company"
    t.string   "inauguration_address"
    t.string   "current_school"
    t.string   "school_address"
    t.boolean  "recommended",            :default => true
    t.integer  "recommended_id"
    t.string   "name"
    t.string   "name_of_company"
    t.string   "sex"
    t.date     "date_of_birth"
    t.date     "founded_of_company"
    t.string   "location"
    t.string   "recipient_address"
    t.string   "company_address"
    t.string   "zip_code"
    t.string   "phone"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "qq"
    t.string   "msn"
    t.string   "fetion"
    t.string   "signature"
    t.integer  "area_id"
  end

  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.text     "embed_code"
    t.integer  "subject_id"
    t.string   "snap_file_name"
    t.string   "snap_content_type"
    t.integer  "snap_file_size"
    t.datetime "snap_updated_at"
    t.datetime "published_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "votes", :force => true do |t|
    t.integer  "voteable_id"
    t.string   "voteable_type"
    t.integer  "user_id"
    t.string   "ip"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "weekly_star_uploads", :force => true do |t|
    t.integer  "weekly_star_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "weekly_stars", :force => true do |t|
    t.string   "design_name"
    t.string   "author"
    t.string   "author_url"
    t.string   "company_name"
    t.string   "company_url"
    t.string   "company_address"
    t.string   "project_name"
    t.text     "design_intro"
    t.text     "design_material"
    t.text     "recommend_reason"
    t.string   "design_style"
    t.string   "design_color"
    t.string   "design_usage"
    t.integer  "votes_count",                   :default => 0
    t.integer  "comments_count",                :default => 0
    t.integer  "shares_count",                  :default => 0
    t.integer  "subject_id"
    t.datetime "published_at"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.string   "main_preview_img_file_name"
    t.string   "main_preview_img_content_type"
    t.integer  "main_preview_img_file_size"
    t.datetime "main_preview_img_updated_at"
  end

  create_table "weekly_tips", :force => true do |t|
    t.text     "body"
    t.string   "week"
    t.datetime "published_at"
    t.integer  "subject_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "weibo_data", :force => true do |t|
    t.string   "q"
    t.string   "idstr"
    t.string   "text"
    t.string   "source"
    t.string   "thumbnail_pic"
    t.string   "bmiddle_pic"
    t.string   "original_pic"
    t.string   "user_id"
    t.string   "user_screen_name"
    t.string   "user_name"
    t.string   "user_profile_image_url"
    t.string   "user_profile_url"
    t.string   "user_gender"
    t.string   "user_location"
    t.string   "user_description"
    t.datetime "created_time"
    t.integer  "status"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

end
