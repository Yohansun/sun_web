class AddColumnToColorDesigns < ActiveRecord::Migration
  def change
    add_column :color_designs, :votes_count, :integer, :default => 0
    add_column :color_designs, :shares_count, :integer, :default => 0
    add_column :color_designs, :comments_count, :integer, :default => 0
  end
end
