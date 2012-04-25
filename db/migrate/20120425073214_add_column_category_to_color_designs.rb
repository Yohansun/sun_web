class AddColumnCategoryToColorDesigns < ActiveRecord::Migration
  def change
    add_column :color_designs, :recommend_color_category1, :string
    add_column :color_designs, :recommend_color_category2, :string
    add_column :color_designs, :recommend_color_category3, :string
  end
end
