class AddSourceToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :source, :string
  	add_column :users, :types, :string
  end
end
