class AddSellerIdToSellerData < ActiveRecord::Migration
  def change
  	add_column :seller_data, :seller_user_id, :integer
  end
end