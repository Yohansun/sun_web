class AddTagsToDesignImages < ActiveRecord::Migration
  def change
  	add_column :design_images, :tags, :text
  end
end
