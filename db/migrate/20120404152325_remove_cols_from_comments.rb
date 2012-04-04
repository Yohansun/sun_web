class RemoveColsFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :inspiration_id
    remove_column :designs, :comments_count
    remove_column :inspirations, :comments_count
  end
end
