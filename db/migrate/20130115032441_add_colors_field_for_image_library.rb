class AddColorsFieldForImageLibrary < ActiveRecord::Migration
  def up
    add_column :design_images, :color1, :string
    add_column :design_images, :color2, :string
    add_column :design_images, :color3, :string
  end

  def down
    remove_column :design_images, :color1
    remove_column :design_images, :color2
    remove_column :design_images, :color3
  end
end
