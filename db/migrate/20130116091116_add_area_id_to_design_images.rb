class AddAreaIdToDesignImages < ActiveRecord::Migration
  def change
    add_column :design_images, :area_id, :integer
  end
end
