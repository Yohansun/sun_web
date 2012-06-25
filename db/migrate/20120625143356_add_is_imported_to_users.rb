class AddIsImportedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_imported, :boolean, :default => false
  end
end
