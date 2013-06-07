class AddInvalidEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :invalid_email, :boolean, default: 0
  end
end
