class AddDesignIdToWeekStar < ActiveRecord::Migration
  def change
  	add_column :weekly_stars, :design_id, :integer
  end
end
