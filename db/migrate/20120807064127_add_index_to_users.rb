class AddIndexToUsers < ActiveRecord::Migration
  def change
  	add_index :users, :role_id
  	add_index :users, :created_at
  end
end
