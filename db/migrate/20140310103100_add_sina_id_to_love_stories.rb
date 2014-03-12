class AddSinaIdToLoveStories < ActiveRecord::Migration
  def change
    add_column :love_stories, :sina_id, :string, :default => 0
  end
end
