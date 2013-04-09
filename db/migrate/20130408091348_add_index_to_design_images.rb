class AddIndexToDesignImages < ActiveRecord::Migration
  def change
    add_index :design_images, [:created_at,:file_file_name,:file_updated_at],:name => "index_design_images_on_timestamp"
  end
end
