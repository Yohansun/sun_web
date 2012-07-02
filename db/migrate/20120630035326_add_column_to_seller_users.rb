class AddColumnToSellerUsers < ActiveRecord::Migration
  def change
  	add_column :seller_users, :mobile, :string
  	add_column :seller_users, :phone, :string
  	add_column :seller_users, :psd, :string
  end
end