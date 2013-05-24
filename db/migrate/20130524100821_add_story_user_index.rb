class AddStoryUserIndex < ActiveRecord::Migration
  def up
  	add_index :story_users, :story_id
  	add_index :story_users, :user_id
  	add_index :story_users, :design_time
  end

  def down
  end
end
