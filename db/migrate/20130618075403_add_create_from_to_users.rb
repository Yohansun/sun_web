class AddCreateFromToUsers < ActiveRecord::Migration
  def change
    add_column :users, :create_from, :string
  end
end
