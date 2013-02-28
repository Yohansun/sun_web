class AddFieldsToImageLibaryCategories < ActiveRecord::Migration
  def change
    add_column :image_library_categories, :lft, :integer
    add_column :image_library_categories, :rgt, :integer
    add_column :image_library_categories, :depth, :integer
    add_column :image_library_categories, :children_count, :integer, :default => 0
  end
end
