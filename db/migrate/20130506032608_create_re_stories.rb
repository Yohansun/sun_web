class CreateReStories < ActiveRecord::Migration
  def change
  	create_table :re_stories do |t|
    t.integer :user_id
    t.integer :story_comment_id
    t.string :content
	t.timestamps
	end
  end
end
