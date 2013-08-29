class CreateILifeInfos < ActiveRecord::Migration
  def change
    create_table :i_life_infos do |t|
    	t.string :title
    	t.string :summary
    	t.string :url

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
