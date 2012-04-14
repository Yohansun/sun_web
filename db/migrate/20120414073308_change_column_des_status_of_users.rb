class ChangeColumnDesStatusOfUsers < ActiveRecord::Migration
  def change
    change_column :users, :des_status, :boolean, :default => nil
  end
end
