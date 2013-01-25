class AddVotesCountToDesignImages < ActiveRecord::Migration
  def change
    add_column :design_images, :votes_count, :integer, :default => 0
  end
end
