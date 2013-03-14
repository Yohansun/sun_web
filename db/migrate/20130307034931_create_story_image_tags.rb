class CreateStoryImageTags < ActiveRecord::Migration
  def change
    create_table :story_image_tags do |t|
      t.integer :image_library_category_id
      t.integer :story_image_id

      t.timestamps
    end
    add_index :story_image_tags, :story_image_id
  end
end