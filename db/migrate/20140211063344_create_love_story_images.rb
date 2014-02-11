class CreateLoveStoryImages < ActiveRecord::Migration
  def change
    create_table :love_story_images do |t|
      t.integer :user_id
      t.integer :love_story_id
      t.string :file_file_name
      t.string :file_content_type
      t.integer :file_file_size
      t.datetime :file_updated_at

      t.timestamps
    end

    add_index :love_story_images, :love_story_id
    add_index :love_story_images, :created_at
    add_index :love_story_images, :updated_at
  end
end
