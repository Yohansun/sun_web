class CreatePointUsers < ActiveRecord::Migration
  def change
    create_table :point_users do |t|
    	t.integer :user_id
      t.integer :point_user_id
    	t.boolean :status

      t.timestamps
    end

    add_index :point_users, :user_id
    add_index :point_users, :point_user_id
    add_index :point_users, :status
  end
end
