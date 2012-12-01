class AddColumnToIndex < ActiveRecord::Migration
  def change
  	add_index :users, :current_sign_in_at
  	add_index :users, :phone
  	add_index :users, :inauguration_company
  	add_index :users, :is_imported
  	add_index :users, :is_top
  	add_index :users, :last_sign_in_at
  	add_index :users, :sign_in_count
  	add_index :users, :old_id
  	add_index :users, :name
  	add_index :users, :username
  	add_index :users, :area_id
  	add_index :users, :des_status
  	add_index :users, :top_order
  	add_index :users, :name_of_company

  	add_index :designs, :is_refresh
  	add_index :designs, :created_at
  	add_index :designs, :style
  	add_index :designs, :design_color
  	add_index :designs, :room_type
  	add_index :designs, :area_id
  	add_index :designs, :title

  	add_index :design_images, :file_file_size
  	add_index :design_images, :imageable_id
  	add_index :design_images, :is_cover

  	add_index :color_codes, :code

  	add_index :comments, :commentable_type
  	add_index :comments, :commentable_id

  	add_index :gifts, :gift_type
  	add_index :gifts, :give_time
  	add_index :gifts, :end_time

  	add_index :inspirations, :votes_count
  	add_index :inspirations, :is_minisite
  	add_index :inspirations, :created_at

  	add_index :areas, :name
  	add_index :areas, :parent_id

  	add_index :customer_replies, :question_id
  	add_index :customer_replies, :updated_at

  	add_index :login_logs, :current_sign_in_at
  	add_index :login_logs, :user_id

  	add_index :votes, :created_at
  	add_index :votes, :user_id

  	add_index :master_designs, :published_at

  	add_index :user_tokens, :is_binding
  	add_index :user_tokens, :uid

  	add_index :seller_data, :created_at
  	add_index :seller_data, :apply_for_tools

  	add_index :weekly_stars, :star_type_id
  	add_index :weekly_stars, :published_at

  	add_index :old_design_files, :old_design_id

  	add_index :seller_users, :username

  	add_index :sys_msgs, :status
  	add_index :sys_msgs, :created_at

  	add_index :scores, :score_type
  	add_index :scores, :created_at
  	add_index :scores, :remark

  	add_index :seller_reports, :file_name
  	add_index :mix_colors, :updated_at
  	add_index :moods, :created_at
  	add_index :my_show_img_uploads, :created_at
  	add_index :reply_msgs, :created_at
  	add_index :sms_logs, :created_at
  end
end
