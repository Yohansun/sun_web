class UpdateUserIdsToSellerUsers < ActiveRecord::Migration
  def up
  	change_column :seller_users, :user_ids, :text
  end

  def down
  end
end
