class CreateFitImages < ActiveRecord::Migration
  def change
    create_table :fit_images do |t|
    	t.string :title
    	t.string :link
    	t.string :file_file_name
	    t.string :file_content_type
	    t.integer :file_file_size
	    t.datetime :file_updated_at

	    t.timestamps
    end
  end
end

