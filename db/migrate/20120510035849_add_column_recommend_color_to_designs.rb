class AddColumnRecommendColorToDesigns < ActiveRecord::Migration
  def change
  	add_column :designs, :design_color, :string
  	add_column :designs, :recommend_color_category1, :string
  end
end