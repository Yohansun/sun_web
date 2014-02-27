class AddViewCountToLoveStories < ActiveRecord::Migration
  def change
    add_column :love_stories, :view_count, :integer, default: 0
  end
end
