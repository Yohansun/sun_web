class MoveColumnRecommendColorToWeeklyStarUploads < ActiveRecord::Migration
  def change
    remove_column :weekly_stars, :recommend_color1
    remove_column :weekly_stars, :recommend_color2
    remove_column :weekly_stars, :recommend_color3
    add_column :weekly_star_uploads, :recommend_color1, :string
    add_column :weekly_star_uploads, :recommend_color2, :string
    add_column :weekly_star_uploads, :recommend_color3, :string
    add_column :weekly_star_uploads, :recommend_color_category1, :string
    add_column :weekly_star_uploads, :recommend_color_category2, :string
    add_column :weekly_star_uploads, :recommend_color_category3, :string
  end
end
