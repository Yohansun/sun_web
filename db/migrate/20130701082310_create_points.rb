class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
    	t.integer :user_id
    	t.integer :point
    	t.integer :used
    	t.datetime :expire_date

      t.timestamps
    end

    add_index :points, :user_id
    add_index :points, :expire_date
  end
end
