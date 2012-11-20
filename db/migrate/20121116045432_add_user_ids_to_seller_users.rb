class AddUserIdsToSellerUsers < ActiveRecord::Migration
  def change
  	add_column :seller_users, :user_ids, :string
  end
end
