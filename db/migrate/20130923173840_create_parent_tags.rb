# -*- encoding : utf-8 -*-
class CreateParentTags < ActiveRecord::Migration
  def change
    create_table :parent_tags do |t|
      t.integer :design_image_id
      t.integer :image_library_category_id

      t.timestamps
    end
    add_index :parent_tags, :design_image_id
    add_index :parent_tags, :image_library_category_id
  end
end
