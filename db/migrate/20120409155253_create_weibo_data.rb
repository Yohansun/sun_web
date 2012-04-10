class CreateWeiboData < ActiveRecord::Migration
  def change
    create_table :weibo_data do |t|
      t.string :q
      t.string :idstr
      t.string :text
      t.string :source
      t.string :thumbnail_pic
      t.string :bmiddle_pic
      t.string :original_pic
      t.string :user_id
      t.string :user_screen_name
      t.string :user_name
      t.string :user_profile_image_url
      t.string :user_profile_url
      t.string :user_gender
      t.string :user_location
      t.string :user_description
      t.datetime :created_time

      t.integer :status
      t.timestamps
    end
  end
end
