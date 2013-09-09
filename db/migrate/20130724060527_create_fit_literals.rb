class CreateFitLiterals < ActiveRecord::Migration
  def change
    create_table :fit_literals do |t|
    	t.string :title
    	t.string :link
	    t.integer :order_id

	    t.timestamps
    end
  end
end
