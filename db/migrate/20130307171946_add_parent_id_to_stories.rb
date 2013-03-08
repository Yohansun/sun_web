class AddParentIdToStories < ActiveRecord::Migration
  def change
    add_column :stories, :parent_id, :integer
    add_column :stories, :votes_count, :integer, :default => 0
  end
end
