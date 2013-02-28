class AddPositionToImageLibraryCategories < ActiveRecord::Migration
  def change
    add_column :image_library_categories, :position, :integer, :default => 0
  end
end
