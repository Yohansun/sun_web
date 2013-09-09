class CreateHomeImageLibPhotos < ActiveRecord::Migration
  def change
    create_table :home_image_lib_photos do |t|
    	t.string :title
    	t.string :url
    	t.integer :vote

    	t.string :file_file_name
    	t.string :file_content_type
    	t.integer :file_file_size
    	t.datetime :file_updated_at

      t.timestamps
    end
  end
end
