class CreateHomeImageLists < ActiveRecord::Migration
  def change
    create_table :home_image_lists do |t|
    	t.string :title
        t.string :value
	    t.timestamps
    end
  end
end
