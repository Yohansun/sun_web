class AddDimensionsHomeImageLibPhotos < ActiveRecord::Migration
  def change
  	add_column :home_image_lib_photos, :dimensions, :string
  	add_column :home_image_lib_photos, :title_limit, :integer
  end
end
