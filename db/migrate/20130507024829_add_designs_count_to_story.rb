class AddDesignsCountToStory < ActiveRecord::Migration
  def change
    add_column :stories, :designs_count, :integer, :default => 0
  end
end
