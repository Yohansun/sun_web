class CreatePointUserGifts < ActiveRecord::Migration
  def change
    create_table :point_user_gifts do |t|
    	t.integer :user_id
    	t.integer :point_gift_id
    	t.integer :gift_point
    	t.integer :gift_number
    	t.integer :total_point
    	t.boolean :status

      t.timestamps
    end
  end
end
