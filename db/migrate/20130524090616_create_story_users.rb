class CreateStoryUsers < ActiveRecord::Migration
  def change
    create_table :story_users do |t|
    	t.integer :story_id
    	t.integer :user_id
    	t.datetime :design_time

      t.timestamps
    end
  end
end
