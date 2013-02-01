# -*- encoding : utf-8 -*-
class AddColorNameToDesignImages < ActiveRecord::Migration
  def change
    add_column :design_images, :color1_name, :string, default: "墙面推荐色"
    add_column :design_images, :color2_name, :string, default: "墙面推荐色"
    add_column :design_images, :color3_name, :string, default: "墙面推荐色"
  end
end
