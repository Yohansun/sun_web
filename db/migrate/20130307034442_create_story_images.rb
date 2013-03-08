class CreateStoryImages < ActiveRecord::Migration
  def change
    create_table :story_images do |t|
      t.integer :user_id
      t.integer :story_id
      t.boolean :is_cover
      t.string :file_file_name
      t.string :file_content_type
      t.integer :file_file_size
      t.datetime :file_updated_at

      t.timestamps
    end
    add_index :story_images, :user_id
    add_index :story_images, :story_id
  end
end
