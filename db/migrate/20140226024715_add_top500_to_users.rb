class AddTop500ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :top500, :boolean, default: 0
  end
end
