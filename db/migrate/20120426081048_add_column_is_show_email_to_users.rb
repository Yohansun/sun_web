class AddColumnIsShowEmailToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :is_show_email, :boolean, :default => true
  end
end