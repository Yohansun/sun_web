class CreateILifeMemoirs < ActiveRecord::Migration
  def change
    create_table :i_life_memoirs do |t|
    	t.string :title
    	t.string :s_title
    	t.string :summary
    	t.string :url

    	t.integer :i_column_type_id

    	t.integer :image_width
    	t.integer :image_height

    	t.string :file_file_name
    	t.string :file_content_type
    	t.integer :file_file_size
    	t.datetime :file_updated_at

    	t.string :video_file_name
    	t.string :video_content_type
    	t.integer :video_file_size

      t.timestamps
    end
  end
end
