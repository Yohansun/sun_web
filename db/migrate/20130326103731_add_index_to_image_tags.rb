class AddIndexToImageTags < ActiveRecord::Migration
  def change
  	add_index :image_tags, [:design_image_id, :image_library_category_id], :name => 'index_design_image_id_and_image_library_category_id'
  end
end
