class AddStarTypeToWeeklyStars < ActiveRecord::Migration
  def change
  	add_column :weekly_stars, :star_type_id, :integer
  end
end
