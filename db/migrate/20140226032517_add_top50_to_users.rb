class AddTop50ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :top50, :boolean, default: 0
  end
end
