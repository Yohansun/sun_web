class AddStoryIdToCollects < ActiveRecord::Migration
  def change
    add_column :collects, :story_id, :integer
  end
end
