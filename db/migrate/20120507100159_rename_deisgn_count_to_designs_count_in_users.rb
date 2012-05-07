class RenameDeisgnCountToDesignsCountInUsers < ActiveRecord::Migration
  def change
    remove_column :users, :design_count
    add_column :users, :designs_count, :integer
  end
end
