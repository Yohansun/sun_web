class RenameColumnTopLogOfSellerUsers < ActiveRecord::Migration
  def change
  	rename_column :seller_users, :top_log, :top_record
  end	
end
