class CreateImageLibraryCategories < ActiveRecord::Migration
  def change
    create_table :image_library_categories do |t|
      t.string :title
      t.integer :parent_id, :default => 0

      t.timestamps
    end
  end
end
