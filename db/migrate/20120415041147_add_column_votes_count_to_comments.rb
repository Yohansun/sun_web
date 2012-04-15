class AddColumnVotesCountToComments < ActiveRecord::Migration
  def change
    add_column :comments, :votes_count, :integer, :default => 0
  end
end
