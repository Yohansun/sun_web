class AddEditByToUsers < ActiveRecord::Migration
  def change
    add_column :users, :edit_by, :string
  end
end
