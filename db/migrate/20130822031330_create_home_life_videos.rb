class CreateHomeLifeVideos < ActiveRecord::Migration
  def change
    create_table :home_life_videos do |t|
    	t.string :title
    	t.string :url
    	t.integer :rank
    	t.integer :position

    	t.integer :image_width
    	t.integer :image_height

    	t.string :file_file_name
    	t.string :file_content_type
    	t.integer :file_file_size
    	t.datetime :file_updated_at

      t.timestamps
    end
  end
end
