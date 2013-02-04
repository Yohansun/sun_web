class AddEditedColorToDesignImages < ActiveRecord::Migration
  def change
  	add_column :design_images, :edited_color, :boolean, default: false
  end
end
