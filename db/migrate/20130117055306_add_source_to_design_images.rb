class AddSourceToDesignImages < ActiveRecord::Migration
  def change
  	add_column :design_images, :source, :string
  	add_column :design_images, :room, :integer
  	add_column :design_images, :content, :text
  end
end