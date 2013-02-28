class CreateDesignTags < ActiveRecord::Migration
  def change
    create_table :design_tags do |t|
      t.integer :design_id
      t.integer :image_library_category_id
      t.timestamps
    end
    add_index :design_tags, :design_id
    add_index :design_tags, :image_library_category_id    
  end
end
