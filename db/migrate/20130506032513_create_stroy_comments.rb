class CreateStroyComments < ActiveRecord::Migration
  def change
  	create_table :story_comments do |t|
    t.integer :user_id
    t.integer :story_id
    t.string :content
	t.timestamps
	end
  end
end
