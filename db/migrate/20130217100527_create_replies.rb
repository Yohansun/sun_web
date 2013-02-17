class CreateReplies < ActiveRecord::Migration
  def change
  	create_table :replies do |t|
  	  t.integer :user_id #拥有该留言的用户
      t.integer :reply_user_id 
      t.text :content

      t.timestamps
    end
  end
end
