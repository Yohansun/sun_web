class AddWeeklyStarToCollect < ActiveRecord::Migration
  def change
  	add_column :collects, :weekly_star_id, :integer
  	add_column :collects, :design_id, :integer
  	add_column :collects, :color_design_id, :integer
  	add_column :collects, :master_design_id, :integer
  end
end
