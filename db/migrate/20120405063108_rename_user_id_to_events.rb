class RenameUserIdToEvents < ActiveRecord::Migration
  def up
    rename_column :events, :sponsor_id, :user_id
  end

  def down
  end
end
