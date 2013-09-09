class CreateHomeLiterHeads < ActiveRecord::Migration
  def change
	  create_table :home_liter_heads do |t|
	  	t.string :title
	  	t.string :link
	  	t.string :genre_type
	  	t.integer :order_id
	  	t.integer :genre

	    t.timestamps
	  end
  end
end
