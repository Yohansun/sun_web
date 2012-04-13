class AddRecommendColorToSomeTables < ActiveRecord::Migration
  def change
    add_column :color_designs, :recommend_color1 ,:string
    add_column :master_designs, :recommend_color1 ,:string
    add_column :weekly_stars, :recommend_color1 ,:string

    add_column :color_designs, :recommend_color2 ,:string
    add_column :master_designs, :recommend_color2 ,:string
    add_column :weekly_stars, :recommend_color2 ,:string

    add_column :color_designs, :recommend_color3 ,:string
    add_column :master_designs, :recommend_color3 ,:string
    add_column :weekly_stars, :recommend_color3 ,:string
  end
end
