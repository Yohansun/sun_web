class AddColumnIsFromMinisiteToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :is_from_minisite, :boolean, :default => false
  end
end