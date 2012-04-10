class DropColorDesignUploads < ActiveRecord::Migration
  def change
    drop_table :color_design_uploads
  end
end
