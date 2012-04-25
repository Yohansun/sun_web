class MoveColumnRecommendColorToMasterDesignUploads < ActiveRecord::Migration
  def change
    remove_column :master_designs, :recommend_color1
    remove_column :master_designs, :recommend_color2
    remove_column :master_designs, :recommend_color3
    add_column :master_design_uploads, :recommend_color1, :string
    add_column :master_design_uploads, :recommend_color2, :string
    add_column :master_design_uploads, :recommend_color3, :string
    add_column :master_design_uploads, :recommend_color_category1, :string
    add_column :master_design_uploads, :recommend_color_category2, :string
    add_column :master_design_uploads, :recommend_color_category3, :string
  end
end