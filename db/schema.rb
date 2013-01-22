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

ActiveRecord::Schema.define(:version => 20130122040820) do

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
    t.integer  "area_id",                :default => 0
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
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "approve_type"
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

  add_index "areas", ["name"], :name => "index_areas_on_name"
  add_index "areas", ["parent_id"], :name => "index_areas_on_parent_id"

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

  add_index "color_codes", ["code"], :name => "index_color_codes_on_code"

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
    t.string   "recommend_color1"
    t.string   "recommend_color2"
    t.string   "recommend_color3"
    t.string   "recommend_color_category1"
    t.string   "recommend_color_category2"
    t.string   "recommend_color_category3"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.string   "content"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "votes_count",      :default => 0
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"

  create_table "customer_replies", :force => true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.string   "question_type"
    t.text     "reply_content"
    t.integer  "reply_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "customer_replies", ["question_id"], :name => "index_customer_replies_on_question_id"
  add_index "customer_replies", ["updated_at"], :name => "index_customer_replies_on_updated_at"

  create_table "design_images", :force => true do |t|
    t.integer  "user_id"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.boolean  "is_cover"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.string   "title"
    t.integer  "last_user_id"
    t.datetime "last_updated_at"
    t.boolean  "audited",           :default => false
    t.string   "color1"
    t.string   "color2"
    t.string   "color3"
    t.integer  "area_id"
    t.string   "source"
    t.integer  "room"
    t.text     "content"
  end

  add_index "design_images", ["created_at"], :name => "NewIndex5"
  add_index "design_images", ["file_file_size"], :name => "index_design_images_on_file_file_size"
  add_index "design_images", ["imageable_id", "imageable_type"], :name => "imageable_id"
  add_index "design_images", ["imageable_id"], :name => "NewIndex2"
  add_index "design_images", ["imageable_id"], :name => "index_design_images_on_imageable_id"
  add_index "design_images", ["imageable_type"], :name => "NewIndex3"
  add_index "design_images", ["is_cover"], :name => "NewIndex4"
  add_index "design_images", ["is_cover"], :name => "index_design_images_on_is_cover"
  add_index "design_images", ["user_id"], :name => "NewIndex1"

  create_table "designs", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "votes_count",               :default => 0
    t.integer  "shares_count",              :default => 0
    t.string   "style"
    t.string   "room_type"
    t.string   "city"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.integer  "area_id"
    t.text     "reason"
    t.integer  "view_count",                :default => 0
    t.boolean  "recommended"
    t.string   "design_color"
    t.string   "recommend_color_category1"
    t.boolean  "is_yda",                    :default => false
    t.boolean  "is_refresh",                :default => false
  end

  add_index "designs", ["area_id"], :name => "NewIndex8"
  add_index "designs", ["area_id"], :name => "index_designs_on_area_id"
  add_index "designs", ["city"], :name => "NewIndex7"
  add_index "designs", ["created_at"], :name => "NewIndex3"
  add_index "designs", ["created_at"], :name => "index_designs_on_created_at"
  add_index "designs", ["design_color"], :name => "index_designs_on_design_color"
  add_index "designs", ["is_refresh"], :name => "index_designs_on_is_refresh"
  add_index "designs", ["recommended"], :name => "NewIndex10"
  add_index "designs", ["room_type"], :name => "NewIndex6"
  add_index "designs", ["room_type"], :name => "index_designs_on_room_type"
  add_index "designs", ["shares_count"], :name => "NewIndex4"
  add_index "designs", ["style"], :name => "NewIndex5"
  add_index "designs", ["style"], :name => "index_designs_on_style"
  add_index "designs", ["title"], :name => "index_designs_on_title"
  add_index "designs", ["user_id"], :name => "NewIndex1"
  add_index "designs", ["view_count"], :name => "NewIndex9"
  add_index "designs", ["votes_count"], :name => "NewIndex2"

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

  create_table "event_attendees", :force => true do |t|
    t.integer  "special_event_id"
    t.integer  "user_id"
    t.string   "benediction",      :limit => 500
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "award_mark"
    t.integer  "design_image_id"
  end

  add_index "event_attendees", ["special_event_id"], :name => "index_event_attendees_on_special_event_id"
  add_index "event_attendees", ["user_id"], :name => "index_event_attendees_on_user_id"

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

  create_table "gifts", :force => true do |t|
    t.string   "gift_type"
    t.string   "gift_sub_type"
    t.string   "winner"
    t.string   "gift_name"
    t.datetime "give_time"
    t.datetime "published_at"
    t.integer  "subject_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.datetime "end_time"
  end

  add_index "gifts", ["end_time"], :name => "index_gifts_on_end_time"
  add_index "gifts", ["gift_type"], :name => "index_gifts_on_gift_type"
  add_index "gifts", ["give_time"], :name => "index_gifts_on_give_time"

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

  create_table "hard_sells", :force => true do |t|
    t.datetime "date"
    t.string   "link"
    t.string   "num"
    t.string   "site"
    t.string   "feature"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "image_library_categories", :force => true do |t|
    t.string   "title"
    t.integer  "parent_id",  :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "image_tags", :force => true do |t|
    t.integer  "design_image_id"
    t.integer  "image_library_category_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "image_tags", ["design_image_id"], :name => "index_image_tags_on_design_image_id"
  add_index "image_tags", ["image_library_category_id"], :name => "index_image_tags_on_image_library_category_id"

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
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.boolean  "is_minisite",      :default => false
  end

  add_index "inspirations", ["created_at"], :name => "index_inspirations_on_created_at"
  add_index "inspirations", ["is_minisite"], :name => "index_inspirations_on_is_minisite"
  add_index "inspirations", ["votes_count"], :name => "index_inspirations_on_votes_count"

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

  create_table "login_logs", :force => true do |t|
    t.integer  "user_id"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "login_logs", ["current_sign_in_at"], :name => "index_login_logs_on_current_sign_in_at"
  add_index "login_logs", ["user_id"], :name => "index_login_logs_on_user_id"

  create_table "maillists", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "master_design_uploads", :force => true do |t|
    t.integer  "master_design_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.string   "recommend_color1"
    t.string   "recommend_color2"
    t.string   "recommend_color3"
    t.string   "recommend_color_category1"
    t.string   "recommend_color_category2"
    t.string   "recommend_color_category3"
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
    t.string   "master_name"
  end

  add_index "master_designs", ["published_at"], :name => "index_master_designs_on_published_at"

  create_table "master_profiles", :force => true do |t|
    t.string   "name"
    t.string   "nationality"
    t.string   "master_field"
    t.text     "position"
    t.text     "interview_content"
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
    t.text     "message"
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
    t.integer  "status"
  end

  add_index "mix_colors", ["updated_at"], :name => "index_mix_colors_on_updated_at"

  create_table "moods", :force => true do |t|
    t.integer  "user_id"
    t.text     "content"
    t.boolean  "is_privacy",       :default => false
    t.string   "color_code"
    t.integer  "shares_count",     :default => 0
    t.string   "color_name"
    t.string   "font_color"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
  end

  add_index "moods", ["created_at"], :name => "index_moods_on_created_at"
  add_index "moods", ["user_id"], :name => "index_moods_on_user_id"

  create_table "my_show_img_uploads", :force => true do |t|
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
  end

  add_index "my_show_img_uploads", ["created_at"], :name => "index_my_show_img_uploads_on_created_at"

  create_table "old_articles", :force => true do |t|
    t.integer  "class_id"
    t.string   "title",      :limit => 200
    t.string   "image"
    t.text     "content"
    t.datetime "publish_at",                               :null => false
    t.integer  "view_count", :limit => 8,   :default => 0
    t.string   "thumb"
  end

  create_table "old_design_files", :force => true do |t|
    t.string   "title",         :limit => 256
    t.string   "src",           :limit => 256
    t.integer  "index"
    t.integer  "old_design_id"
    t.datetime "create_date",                  :null => false
    t.integer  "photo_type",    :limit => 1
    t.binary   "is_cover",      :limit => 1
    t.string   "space",         :limit => 20
  end

  add_index "old_design_files", ["old_design_id"], :name => "NewIndex1"
  add_index "old_design_files", ["old_design_id"], :name => "index_old_design_files_on_old_design_id"

  create_table "old_designs", :force => true do |t|
    t.string   "title",       :limit => 256
    t.string   "tags",        :limit => 256
    t.integer  "user_id"
    t.datetime "create_date",                               :null => false
    t.integer  "view_count",  :limit => 8
    t.binary   "recommended", :limit => 1
    t.string   "style",       :limit => 20
    t.binary   "month_star",  :limit => 1
    t.integer  "month",       :limit => 1
    t.integer  "year"
    t.integer  "top_n",                      :default => 0, :null => false
  end

  add_index "old_designs", ["user_id"], :name => "NewIndex1"

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

  create_table "phone_expenses", :force => true do |t|
    t.float    "user_id",     :default => 0.0
    t.float    "register",    :default => 0.0
    t.float    "design",      :default => 0.0
    t.float    "vote",        :default => 0.0
    t.float    "comment",     :default => 0.0
    t.float    "share",       :default => 0.0
    t.float    "inspiration", :default => 0.0
    t.float    "total",       :default => 0.0
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "intro"
    t.text     "body"
    t.integer  "admin_id"
    t.integer  "subject_id"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.datetime "published_at"
    t.string   "preview_img_file_name"
    t.string   "preview_img_content_type"
    t.integer  "preview_img_file_size"
    t.datetime "preview_img_updated_at"
    t.string   "content_source"
    t.integer  "browsing_count",           :default => 0
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

  create_table "reply_msgs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "comment_id"
    t.string   "reply_type"
    t.integer  "source_reply_id"
    t.string   "content"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "message_id"
  end

  add_index "reply_msgs", ["created_at"], :name => "index_reply_msgs_on_created_at"

  create_table "roles", :force => true do |t|
    t.string   "role"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "scores", :force => true do |t|
    t.integer  "user_id"
    t.integer  "score_type"
    t.integer  "status"
    t.string   "remark"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "amount"
  end

  add_index "scores", ["created_at"], :name => "index_scores_on_created_at"
  add_index "scores", ["remark"], :name => "index_scores_on_remark"
  add_index "scores", ["score_type"], :name => "index_scores_on_score_type"

  create_table "seller_data", :force => true do |t|
    t.integer  "sales"
    t.string   "product_top1"
    t.string   "product_top2"
    t.string   "product_top3"
    t.boolean  "apply_for_tools",       :default => false
    t.string   "tool_ids"
    t.integer  "user_id"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.integer  "seller_user_id"
    t.integer  "product_top1_quantity", :default => 0
    t.integer  "product_top2_quantity", :default => 0
    t.integer  "product_top3_quantity", :default => 0
    t.integer  "art_paint_quantity",    :default => 0
    t.text     "remarks"
  end

  add_index "seller_data", ["apply_for_tools"], :name => "index_seller_data_on_apply_for_tools"
  add_index "seller_data", ["created_at"], :name => "index_seller_data_on_created_at"

  create_table "seller_reports", :force => true do |t|
    t.string   "file_name"
    t.datetime "statistical_time"
    t.datetime "created_time"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "seller_reports", ["file_name"], :name => "index_seller_reports_on_file_name"

  create_table "seller_users", :force => true do |t|
    t.string   "email",                  :default => "",  :null => false
    t.string   "username",               :default => "",  :null => false
    t.string   "area_id",                :default => "0", :null => false
    t.string   "encrypted_password",     :default => "",  :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "mobile"
    t.string   "phone"
    t.string   "psd"
    t.string   "top_record"
    t.text     "user_ids"
  end

  add_index "seller_users", ["email"], :name => "index_seller_users_on_email", :unique => true
  add_index "seller_users", ["reset_password_token"], :name => "index_seller_users_on_reset_password_token", :unique => true
  add_index "seller_users", ["username"], :name => "index_seller_users_on_username"

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
    t.integer  "sys_msg_id"
  end

  create_table "skin_kv_uploads", :force => true do |t|
    t.string   "kv_link"
    t.string   "link_coords"
    t.integer  "skin_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "kv_thumb_file_name"
    t.string   "kv_thumb_content_type"
    t.integer  "kv_thumb_file_size"
    t.datetime "kv_thumb_updated_at"
  end

  create_table "skins", :force => true do |t|
    t.integer  "skin_type_id"
    t.string   "user_ids"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "sms_logs", :force => true do |t|
    t.integer  "seller_user_id"
    t.integer  "user_id"
    t.text     "content"
    t.text     "response"
    t.string   "send_id"
    t.string   "result"
    t.string   "description"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "sms_logs", ["created_at"], :name => "index_sms_logs_on_created_at"

  create_table "special_events", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "start_at"
    t.datetime "due_at"
    t.integer  "actived",    :limit => 1, :default => 0
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "special_events", ["due_at"], :name => "index_special_events_on_due_at"
  add_index "special_events", ["start_at"], :name => "index_special_events_on_start_at"

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

  create_table "sys_msgs", :force => true do |t|
    t.string   "reply_name"
    t.text     "content"
    t.integer  "reply_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "status"
    t.integer  "user_id"
    t.string   "reply_type"
    t.string   "re_url"
    t.integer  "site_message_id"
  end

  add_index "sys_msgs", ["created_at"], :name => "index_sys_msgs_on_created_at"
  add_index "sys_msgs", ["status"], :name => "index_sys_msgs_on_status"

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

  create_table "tools", :force => true do |t|
    t.string   "name"
    t.integer  "total",            :default => 0
    t.integer  "has_applied",      :default => 0
    t.integer  "subject_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
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
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.boolean  "is_binding",   :default => false
    t.string   "access_token"
  end

  add_index "user_tokens", ["is_binding"], :name => "index_user_tokens_on_is_binding"
  add_index "user_tokens", ["uid"], :name => "index_user_tokens_on_uid"

  create_table "users", :force => true do |t|
    t.string   "email",                     :default => "",    :null => false
    t.string   "encrypted_password",        :default => "",    :null => false
    t.integer  "role_id"
    t.string   "username"
    t.boolean  "des_status"
    t.string   "inauguration_company"
    t.string   "inauguration_address"
    t.string   "current_school"
    t.string   "school_address"
    t.boolean  "recommended",               :default => true
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
    t.integer  "sign_in_count",             :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.string   "qq"
    t.string   "msn"
    t.string   "fetion"
    t.string   "signature"
    t.integer  "area_id"
    t.integer  "old_id"
    t.boolean  "is_show_email",             :default => true
    t.boolean  "is_from_minisite",          :default => false
    t.integer  "recommend_designer_status", :default => 0
    t.integer  "designs_count"
    t.boolean  "is_imported",               :default => false
    t.boolean  "is_top",                    :default => false
    t.string   "top_reason"
    t.integer  "top_order",                 :default => 0
    t.integer  "minisite_id"
    t.string   "source"
    t.string   "types"
  end

  add_index "users", ["area_id"], :name => "index_users_on_area_id"
  add_index "users", ["created_at"], :name => "index_users_on_created_at"
  add_index "users", ["current_sign_in_at"], :name => "index_users_on_current_sign_in_at"
  add_index "users", ["des_status"], :name => "index_users_on_des_status"
  add_index "users", ["inauguration_company"], :name => "index_users_on_inauguration_company"
  add_index "users", ["is_imported"], :name => "index_users_on_is_imported"
  add_index "users", ["is_top"], :name => "index_users_on_is_top"
  add_index "users", ["last_sign_in_at"], :name => "index_users_on_last_sign_in_at"
  add_index "users", ["name"], :name => "index_users_on_name"
  add_index "users", ["name_of_company"], :name => "index_users_on_name_of_company"
  add_index "users", ["old_id"], :name => "index_users_on_old_id"
  add_index "users", ["phone"], :name => "index_users_on_phone"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["role_id"], :name => "index_users_on_role_id"
  add_index "users", ["sign_in_count"], :name => "index_users_on_sign_in_count"
  add_index "users", ["top_order"], :name => "index_users_on_top_order"
  add_index "users", ["username"], :name => "index_users_on_username"

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

  add_index "votes", ["created_at"], :name => "index_votes_on_created_at"
  add_index "votes", ["user_id"], :name => "index_votes_on_user_id"

  create_table "weekly_star_uploads", :force => true do |t|
    t.integer  "weekly_star_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.string   "recommend_color1"
    t.string   "recommend_color2"
    t.string   "recommend_color3"
    t.string   "recommend_color_category1"
    t.string   "recommend_color_category2"
    t.string   "recommend_color_category3"
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
    t.string   "design_link"
    t.integer  "star_type_id"
  end

  add_index "weekly_stars", ["published_at"], :name => "index_weekly_stars_on_published_at"
  add_index "weekly_stars", ["star_type_id"], :name => "index_weekly_stars_on_star_type_id"

  create_table "weekly_tips", :force => true do |t|
    t.text     "body"
    t.string   "week"
    t.datetime "published_at"
    t.integer  "subject_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "weibo_items", :force => true do |t|
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

  create_table "yda_games", :force => true do |t|
    t.string   "name"
    t.string   "school"
    t.string   "specialty"
    t.string   "grade"
    t.integer  "paperwork_type"
    t.string   "paperwork_no"
    t.string   "mobile"
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.string   "postcode"
    t.string   "email"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "user_id"
  end

end
