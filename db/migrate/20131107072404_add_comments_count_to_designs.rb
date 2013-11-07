class AddCommentsCountToDesigns < ActiveRecord::Migration
  def change
    add_column :designs, :comments_count, :integer, :default => 0
  end
end
