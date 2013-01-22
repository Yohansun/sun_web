class CreateImageTags < ActiveRecord::Migration
  def change
    create_table :image_tags do |t|
      t.integer :design_image_id
      t.integer :image_library_category_id
      t.timestamps
    end
    remove_column :design_images, :tags
    add_index :image_tags, :design_image_id
    add_index :image_tags, :image_library_category_id    
  end
end
