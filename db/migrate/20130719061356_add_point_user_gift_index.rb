class AddPointUserGiftIndex < ActiveRecord::Migration
  def up
  	add_index :point_user_gifts, :user_id
  	add_index :point_user_gifts, :point_gift_id
  	add_index :point_user_gifts, :status
  end

  def down
  end
end
