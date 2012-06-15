class AddColumnBrowsingCountToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :browsing_count, :integer, :default => 0
  end
end
