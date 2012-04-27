class AddColumnDesignLinkToWeeklyStars < ActiveRecord::Migration
  def change
  	add_column :weekly_stars, :design_link, :string
  end
end