class AddColumnTopOrderToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :top_order, :integer, :default => 0
  	add_column :seller_users, :top_log, :string
  end
end
