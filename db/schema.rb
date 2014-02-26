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

ActiveRecord::Schema.define(:version => 20140226024715) do

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

  add_index "avatars", ["user_id"], :name => "index_avatars_on_user_id"

  create_table "baicheng_events", :force => true do |t|
    t.integer  "eventable_id"
    t.string   "eventable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "area_id"
  end

  add_index "baicheng_events", ["area_id"], :name => "index_baicheng_events_on_area_id"
  add_index "baicheng_events", ["eventable_type", "eventable_id"], :name => "index_baicheng_events_on_eventable_type_and_eventable_id"

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

  create_table "celebrities", :force => true do |t|
    t.string   "name",                                  :null => false
    t.string   "intro",                 :default => ""
    t.integer  "celebrity_category_id"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  add_index "celebrities", ["celebrity_category_id"], :name => "index_celebrities_on_celebrity_category_id"

  create_table "celebrity_categories", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "celebrity_content_boards", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "celebrity_notes", :force => true do |t|
    t.string   "name",                                         :null => false
    t.text     "intro"
    t.text     "content"
    t.string   "thumb_file_name"
    t.string   "thumb_content_type"
    t.integer  "thumb_file_size"
    t.datetime "thumb_updated_at"
    t.boolean  "recommended",                :default => true, :null => false
    t.integer  "master_profile_id"
    t.integer  "celebrity_content_board_id"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  add_index "celebrity_notes", ["celebrity_content_board_id"], :name => "index_celebrity_notes_on_celebrity_content_board_id"
  add_index "celebrity_notes", ["master_profile_id"], :name => "index_celebrity_notes_on_master_profile_id"
  add_index "celebrity_notes", ["recommended"], :name => "index_celebrity_notes_on_recommended"

  create_table "celebrity_question_categories", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "parent_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "celebrity_question_categories", ["parent_id"], :name => "index_celebrity_question_categories_on_parent_id"

  create_table "celebrity_question_images", :force => true do |t|
    t.integer  "resource_id"
    t.string   "resource_type"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "celebrity_question_key_scopes", :force => true do |t|
    t.string   "name"
    t.text     "key_arr"
    t.integer  "celebrity_content_board_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "celebrity_question_replies", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "celebrity_question_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "media_id"
  end

  add_index "celebrity_question_replies", ["celebrity_question_id"], :name => "index_celebrity_question_replies_on_celebrity_question_id"
  add_index "celebrity_question_replies", ["user_id"], :name => "index_celebrity_question_replies_on_user_id"

  create_table "celebrity_questions", :force => true do |t|
    t.string   "name",                       :null => false
    t.string   "key",                        :null => false
    t.text     "content"
    t.integer  "master_profile_id"
    t.integer  "user_id"
    t.integer  "celebrity_content_board_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "celebrity_questions", ["celebrity_content_board_id"], :name => "index_celebrity_questions_on_celebrity_content_board_id"
  add_index "celebrity_questions", ["master_profile_id"], :name => "index_celebrity_questions_on_master_profile_id"
  add_index "celebrity_questions", ["user_id"], :name => "index_celebrity_questions_on_user_id"

  create_table "channel_tips", :force => true do |t|
    t.integer  "rank"
    t.string   "title"
    t.string   "content"
    t.string   "link"
    t.integer  "admin_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "collects", :force => true do |t|
    t.integer  "user_id"
    t.integer  "design_image_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "weekly_star_id"
    t.integer  "design_id"
    t.integer  "color_design_id"
    t.integer  "master_design_id"
    t.integer  "inspiration_id"
    t.integer  "story_id"
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

  create_table "contract_images", :force => true do |t|
    t.integer  "contract_id"
    t.integer  "user_id"
    t.boolean  "is_cover",          :default => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "contracts", :force => true do |t|
    t.string   "genre"
    t.integer  "u_id"
    t.integer  "story_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cubit_fixtures", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "fixture_area"
    t.string   "fixture_type"
    t.integer  "area_id"
    t.string   "house_name"
    t.string   "pre_price"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "style"
  end

  create_table "custom_meta", :force => true do |t|
    t.string   "fullpath"
    t.string   "title"
    t.string   "description"
    t.string   "keywords"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

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
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
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
    t.text     "reason"
    t.string   "color1_name",       :default => "墙面推荐色"
    t.string   "color2_name",       :default => "墙面推荐色"
    t.string   "color3_name",       :default => "墙面推荐色"
    t.integer  "votes_count",       :default => 0
    t.boolean  "edited_color",      :default => false
    t.string   "pinyin"
    t.integer  "view_count",        :default => 0
    t.integer  "collects_count",    :default => 0
    t.integer  "sorts",             :default => 100
    t.boolean  "no_audited",        :default => false
  end

  add_index "design_images", ["area_id"], :name => "area_id"
  add_index "design_images", ["audited"], :name => "audited"
  add_index "design_images", ["created_at", "file_file_name", "file_updated_at"], :name => "index_design_images_on_timestamp"
  add_index "design_images", ["created_at", "imageable_id", "imageable_type", "user_id", "edited_color", "audited"], :name => "count_index"
  add_index "design_images", ["created_at"], :name => "NewIndex5"
  add_index "design_images", ["edited_color"], :name => "edited_color"
  add_index "design_images", ["file_file_size"], :name => "index_design_images_on_file_file_size"
  add_index "design_images", ["imageable_id"], :name => "index_design_images_on_imageable_id"
  add_index "design_images", ["imageable_type"], :name => "index_design_images_on_imageable_type"
  add_index "design_images", ["is_cover"], :name => "NewIndex4"
  add_index "design_images", ["is_cover"], :name => "index_design_images_on_is_cover"
  add_index "design_images", ["sorts"], :name => "sorts"
  add_index "design_images", ["title"], :name => "index_design_images_on_title"
  add_index "design_images", ["user_id"], :name => "NewIndex1"

  create_table "design_tags", :force => true do |t|
    t.integer  "design_id"
    t.integer  "image_library_category_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "design_tags", ["design_id"], :name => "index_design_tags_on_design_id"
  add_index "design_tags", ["image_library_category_id"], :name => "index_design_tags_on_image_library_category_id"

  create_table "designer_events", :force => true do |t|
    t.string   "start_time"
    t.datetime "end_time"
    t.string   "title"
    t.string   "intro"
    t.text     "content"
    t.boolean  "is_save",           :default => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "event_type"
  end

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
    t.string   "property_name"
    t.text     "speech"
    t.boolean  "future_star_active",        :default => false
    t.integer  "story_id"
    t.boolean  "baicheng_active",           :default => false
    t.integer  "story_talking_id"
    t.integer  "comments_count",            :default => 0
    t.string   "come_from"
  end

  add_index "designs", ["area_id"], :name => "NewIndex8"
  add_index "designs", ["area_id"], :name => "index_designs_on_area_id"
  add_index "designs", ["created_at"], :name => "NewIndex3"
  add_index "designs", ["created_at"], :name => "index_designs_on_created_at"
  add_index "designs", ["design_color"], :name => "index_designs_on_design_color"
  add_index "designs", ["is_refresh"], :name => "index_designs_on_is_refresh"
  add_index "designs", ["room_type"], :name => "NewIndex6"
  add_index "designs", ["room_type"], :name => "index_designs_on_room_type"
  add_index "designs", ["style"], :name => "NewIndex5"
  add_index "designs", ["style"], :name => "index_designs_on_style"
  add_index "designs", ["title"], :name => "index_designs_on_title"
  add_index "designs", ["user_id"], :name => "NewIndex1"
  add_index "designs", ["view_count"], :name => "NewIndex9"
  add_index "designs", ["votes_count"], :name => "NewIndex2"

  create_table "dialog_celebrity_pages", :force => true do |t|
    t.string   "edit_treasury_title"
    t.boolean  "last_celebrity",                   :default => false
    t.boolean  "last_master",                      :default => false
    t.integer  "celebrity_id"
    t.integer  "master_id"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.string   "edit_treasury_thumb_file_name"
    t.string   "edit_treasury_thumb_content_type"
    t.integer  "edit_treasury_thumb_file_size"
    t.datetime "edit_treasury_thumb_updated_at"
    t.string   "edit_treasury_url"
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

  create_table "editor_treasuries", :force => true do |t|
    t.string   "name",                                         :null => false
    t.text     "content"
    t.text     "intro"
    t.string   "thumb_file_name"
    t.string   "thumb_content_type"
    t.integer  "thumb_file_size"
    t.datetime "thumb_updated_at"
    t.boolean  "recommended",                :default => true, :null => false
    t.integer  "celebrity_content_board_id"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  add_index "editor_treasuries", ["celebrity_content_board_id"], :name => "index_editor_treasuries_on_celebrity_content_board_id"
  add_index "editor_treasuries", ["recommended"], :name => "index_editor_treasuries_on_recommended"

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

  create_table "event_kvs", :force => true do |t|
    t.string   "url"
    t.string   "klass_name"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
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

  create_table "examples", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.string   "name"
    t.string   "style"
    t.boolean  "is_save",          :default => false
    t.integer  "votes_count",      :default => 0
    t.integer  "shares_count",     :default => 0
    t.integer  "comment_count",    :default => 0
    t.integer  "user_id"
    t.boolean  "top",              :default => false
    t.boolean  "choice",           :default => false
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
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

  create_table "fit_images", :force => true do |t|
    t.string   "title"
    t.string   "link"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "fit_literals", :force => true do |t|
    t.string   "title"
    t.string   "link"
    t.integer  "order_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "forwar_users", :force => true do |t|
    t.string   "username"
    t.string   "genre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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

  create_table "home_banners", :force => true do |t|
    t.string   "banner_name"
    t.string   "link"
    t.integer  "user_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "home_colors", :force => true do |t|
    t.string   "title"
    t.string   "link"
    t.integer  "order_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "home_costs", :force => true do |t|
    t.string   "title"
    t.string   "link"
    t.integer  "order_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "home_design_shows", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "vote"
    t.string   "dimensions"
    t.integer  "position"
    t.integer  "design_type"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "image_width"
    t.integer  "image_height"
  end

  create_table "home_heads", :force => true do |t|
    t.string   "title"
    t.string   "link"
    t.integer  "order_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "home_image_lib_photos", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "vote"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "dimensions"
    t.integer  "title_limit"
  end

  create_table "home_image_lib_tags", :force => true do |t|
    t.integer  "category_id"
    t.string   "category_list"
    t.integer  "rank",          :default => 0
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "home_image_lists", :force => true do |t|
    t.string   "title"
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "home_kvs", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "position"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.boolean  "visible",           :default => true
  end

  create_table "home_life_videos", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "rank"
    t.integer  "position"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "home_liter_heads", :force => true do |t|
    t.string   "title"
    t.string   "link"
    t.string   "genre_type"
    t.integer  "order_id"
    t.integer  "genre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "home_recommends", :force => true do |t|
    t.integer  "position"
    t.string   "title"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "home_spaces", :force => true do |t|
    t.string   "title"
    t.string   "link"
    t.integer  "order_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "home_styles", :force => true do |t|
    t.string   "title"
    t.string   "link"
    t.integer  "order_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "home_type_categories", :force => true do |t|
    t.integer  "tag"
    t.integer  "tagable_id"
    t.string   "tagable_type", :default => "HomeType"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "home_types", :force => true do |t|
    t.string   "title"
    t.string   "link"
    t.integer  "order_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "hx_kvs", :force => true do |t|
    t.string   "url"
    t.integer  "position"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "hx_kvs", ["position"], :name => "index_hx_kvs_on_position"

  create_table "hx_maps", :force => true do |t|
    t.integer  "hx_kv_id"
    t.string   "url"
    t.integer  "width"
    t.integer  "high"
    t.integer  "x_line"
    t.integer  "y_line"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "hx_news", :force => true do |t|
    t.integer  "position"
    t.string   "title"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "hx_news", ["position"], :name => "index_hx_news_on_position"

  create_table "hx_profiles", :force => true do |t|
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "i_banner_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "i_banners", :force => true do |t|
    t.string   "photo_name"
    t.string   "page_name"
    t.integer  "position"
    t.string   "class_name"
    t.integer  "i_banner_group_id"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "size"
    t.string   "url"
  end

  create_table "i_column_data", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "rank"
    t.integer  "position"
    t.integer  "i_column_type_id"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "i_column_types", :force => true do |t|
    t.string   "name"
    t.string   "name_code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "rank"
  end

  create_table "i_life_infos", :force => true do |t|
    t.string   "title"
    t.string   "summary"
    t.string   "url"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "i_life_memoirs", :force => true do |t|
    t.string   "title"
    t.string   "s_title"
    t.string   "summary"
    t.string   "url"
    t.integer  "i_column_type_id"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "video_name"
  end

  create_table "image_library_categories", :force => true do |t|
    t.string   "title"
    t.integer  "parent_id",      :default => 0
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.integer  "children_count", :default => 0
    t.integer  "position",       :default => 0
    t.string   "pinyin"
  end

  add_index "image_library_categories", ["pinyin"], :name => "index_image_library_categories_on_pinyin"
  add_index "image_library_categories", ["title"], :name => "title"

  create_table "image_tags", :force => true do |t|
    t.integer  "design_image_id"
    t.integer  "image_library_category_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "genre"
  end

  add_index "image_tags", ["design_image_id", "image_library_category_id"], :name => "index_design_image_id_and_image_library_category_id"
  add_index "image_tags", ["design_image_id"], :name => "design_image_id"
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

  create_table "kv_maps", :force => true do |t|
    t.integer  "home_kv_id"
    t.string   "url"
    t.integer  "width"
    t.integer  "high"
    t.integer  "x_line"
    t.integer  "y_line"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "event_kv_id"
  end

  create_table "land_sources", :force => true do |t|
    t.string   "site"
    t.string   "code"
    t.string   "position"
    t.string   "path"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lands", :force => true do |t|
    t.string   "source"
    t.string   "source_ip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "lands", ["created_at"], :name => "created_at"
  add_index "lands", ["created_at"], :name => "index_lands_on_created_at"
  add_index "lands", ["source"], :name => "index_lands_on_source"
  add_index "lands", ["source"], :name => "source"

  create_table "lanterns", :force => true do |t|
    t.integer  "user_id"
    t.string   "content"
    t.integer  "forwar"
    t.integer  "date_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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

  create_table "love_stories", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "area_id"
    t.string   "user_name"
    t.string   "come_from"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "love_story_images", :force => true do |t|
    t.integer  "user_id"
    t.integer  "love_story_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "love_story_images", ["created_at"], :name => "index_love_story_images_on_created_at"
  add_index "love_story_images", ["love_story_id"], :name => "index_love_story_images_on_love_story_id"
  add_index "love_story_images", ["updated_at"], :name => "index_love_story_images_on_updated_at"

  create_table "maillists", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "master_design_uploads", :force => true do |t|
    t.integer  "master_design_id"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
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
    t.boolean  "is_cover",                  :default => false
    t.string   "file2_file_name"
    t.string   "file2_content_type"
    t.integer  "file2_file_size"
    t.datetime "file2_updated_at"
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
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
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
    t.integer  "mtype",                        :default => 0
    t.integer  "celebrity_content_board_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "master_profiles", ["celebrity_content_board_id"], :name => "index_master_profiles_on_celebrity_content_board_id"
  add_index "master_profiles", ["mtype"], :name => "index_master_profiles_on_mtype"

  create_table "master_videos", :force => true do |t|
    t.string   "py"
    t.string   "name"
    t.text     "intro"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "media", :force => true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "password"
    t.text     "boards"
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

  create_table "owner_enters", :force => true do |t|
    t.string   "content"
    t.string   "title"
    t.integer  "user_id"
    t.string   "link"
    t.integer  "order_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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

  create_table "parent_tags", :force => true do |t|
    t.integer  "design_image_id"
    t.integer  "image_library_category_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "parent_tags", ["design_image_id"], :name => "index_parent_tags_on_design_image_id"
  add_index "parent_tags", ["image_library_category_id"], :name => "index_parent_tags_on_image_library_category_id"

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

  create_table "phones", :force => true do |t|
    t.string   "phone"
    t.string   "genre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "point_exchanges", :force => true do |t|
    t.integer  "area_id"
    t.datetime "buy_date"
    t.integer  "point_store_id"
    t.integer  "point_product_id"
    t.integer  "product_number"
    t.integer  "total_point"
    t.boolean  "status"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "point_user_id"
  end

  add_index "point_exchanges", ["area_id"], :name => "index_point_exchanges_on_area_id"
  add_index "point_exchanges", ["buy_date"], :name => "index_point_exchanges_on_buy_date"
  add_index "point_exchanges", ["point_product_id"], :name => "index_point_exchanges_on_point_product_id"
  add_index "point_exchanges", ["point_store_id"], :name => "index_point_exchanges_on_point_store_id"
  add_index "point_exchanges", ["status"], :name => "index_point_exchanges_on_status"

  create_table "point_gifts", :force => true do |t|
    t.string   "gift_type"
    t.string   "gift_name"
    t.integer  "gift_point"
    t.boolean  "flag",              :default => true
    t.integer  "rank"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "point_gifts", ["flag"], :name => "index_point_gifts_on_flag"
  add_index "point_gifts", ["gift_name"], :name => "index_point_gifts_on_gift_name"

  create_table "point_products", :force => true do |t|
    t.string   "product_type"
    t.string   "product_name"
    t.string   "product_point"
    t.boolean  "flag",          :default => true
    t.integer  "rank"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "point_products", ["flag"], :name => "index_point_products_on_flag"
  add_index "point_products", ["product_name"], :name => "index_point_products_on_product_name"

  create_table "point_stores", :force => true do |t|
    t.string   "store_no"
    t.integer  "area_id"
    t.string   "sale_area"
    t.string   "sale_department"
    t.string   "sale_city"
    t.string   "sale_subsidiary"
    t.string   "city_level"
    t.string   "store_name"
    t.string   "store_type"
    t.string   "store_distribution"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "point_stores", ["area_id"], :name => "index_point_stores_on_area_id"

  create_table "point_user_gifts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "point_gift_id"
    t.integer  "gift_point"
    t.integer  "gift_number"
    t.integer  "total_point"
    t.boolean  "status"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "point_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "point_user_id"
    t.boolean  "status"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "point_users", ["point_user_id"], :name => "index_point_users_on_point_user_id"
  add_index "point_users", ["status"], :name => "index_point_users_on_status"
  add_index "point_users", ["user_id"], :name => "index_point_users_on_user_id"

  create_table "points", :force => true do |t|
    t.integer  "user_id"
    t.integer  "point"
    t.integer  "used"
    t.datetime "expire_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
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

  create_table "questions", :force => true do |t|
    t.string   "title"
    t.string   "link"
    t.integer  "rank"
    t.integer  "admin_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rep_replies", :force => true do |t|
    t.integer  "user_id"
    t.integer  "comment_id"
    t.string   "reply_type"
    t.integer  "source_reply_id"
    t.string   "content"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "reply_id"
  end

  create_table "replies", :force => true do |t|
    t.integer  "user_id"
    t.integer  "reply_user_id"
    t.text     "content"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "genre"
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

  create_table "seo_sites", :force => true do |t|
    t.string   "title"
    t.string   "link"
    t.integer  "rank"
    t.integer  "genre"
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

  create_table "sign_checks", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "prize",      :default => false
    t.integer  "date_at"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "simple_captcha_data", :force => true do |t|
    t.string   "key",        :limit => 40
    t.string   "value",      :limit => 6
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "simple_captcha_data", ["key"], :name => "idx_key"

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
    t.boolean  "actived",    :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "special_events", ["actived"], :name => "index_special_events_on_actived"
  add_index "special_events", ["due_at"], :name => "index_special_events_on_due_at"

  create_table "stories", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "area_id"
    t.integer  "user_id"
    t.string   "property_name"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "parent_id"
    t.integer  "votes_count",   :default => 0
    t.string   "budget"
    t.text     "demand"
    t.boolean  "is_save"
    t.integer  "comment_count"
    t.integer  "designs_count", :default => 0
  end

  create_table "story_image_tags", :force => true do |t|
    t.integer  "image_library_category_id"
    t.integer  "story_image_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "story_image_tags", ["story_image_id"], :name => "index_story_image_tags_on_story_image_id"

  create_table "story_images", :force => true do |t|
    t.integer  "user_id"
    t.integer  "story_id"
    t.boolean  "is_cover"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "story_images", ["story_id"], :name => "index_story_images_on_story_id"
  add_index "story_images", ["user_id"], :name => "index_story_images_on_user_id"

  create_table "story_users", :force => true do |t|
    t.integer  "story_id"
    t.integer  "user_id"
    t.datetime "design_time"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "story_users", ["design_time"], :name => "index_story_users_on_design_time"
  add_index "story_users", ["story_id"], :name => "index_story_users_on_story_id"
  add_index "story_users", ["user_id"], :name => "index_story_users_on_user_id"

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

  create_table "tag_sorts", :force => true do |t|
    t.string   "category_id"
    t.string   "title"
    t.integer  "genre"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
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

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "job"
    t.string   "url"
    t.integer  "is_save",           :default => 0
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.boolean  "more_url",          :default => false
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
    t.boolean  "invalid_email",             :default => false
    t.string   "create_from"
    t.boolean  "is_admin",                  :default => false
    t.string   "genre"
    t.string   "edit_by"
    t.string   "price"
    t.boolean  "top500",                    :default => false
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

  create_table "visit_ips", :force => true do |t|
    t.string   "ip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "visit_ips", ["ip"], :name => "index_visit_ips_on_ip"

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
    t.integer  "design_id"
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

  create_table "winning_images", :force => true do |t|
    t.string   "image_url"
    t.integer  "winning_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "winnings", :force => true do |t|
    t.string   "image_url"
    t.string   "url"
    t.string   "name"
    t.string   "centent"
    t.string   "genre"
    t.string   "area"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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
