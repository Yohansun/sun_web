class CreateHomeTypes < ActiveRecord::Migration
  def change
    create_table :home_types do |t|
    	t.string :title
    	t.string :link
    	t.integer :order_id
    	t.string :file_file_name
	    t.string :file_content_type
	    t.integer :file_file_size
	    t.datetime :file_updated_at

	    t.timestamps
    end
  end
end
