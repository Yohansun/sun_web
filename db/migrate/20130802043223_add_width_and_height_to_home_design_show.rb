class AddWidthAndHeightToHomeDesignShow < ActiveRecord::Migration
  def change
  	add_column :home_design_shows, :image_width, :integer
  	add_column :home_design_shows, :image_height, :integer
  end
end
