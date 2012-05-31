class AddUserIdToYdaGame < ActiveRecord::Migration
  def change
  	add_column :yda_games, :user_id, :integer
  end
end
