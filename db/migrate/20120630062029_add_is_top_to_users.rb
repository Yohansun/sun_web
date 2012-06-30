class AddIsTopToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :is_top, :boolean, :default => false
  	add_column :users, :top_reason, :string
  end
end
