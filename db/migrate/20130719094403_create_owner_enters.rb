class CreateOwnerEnters < ActiveRecord::Migration
  def change
    create_table :owner_enters do |t|
    	t.string :content
    	t.string :title
    	t.integer :user_id
    	t.string :link
    	t.integer :order_id

        t.timestamps
    end
  end
end
