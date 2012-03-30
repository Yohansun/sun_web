class AddNewContactToUsers < ActiveRecord::Migration
  def change
    add_column :users, :qq, :string
    add_column :users, :msn, :string
    add_column :users, :fetion, :string
  end
end
