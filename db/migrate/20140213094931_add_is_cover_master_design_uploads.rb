class AddIsCoverMasterDesignUploads < ActiveRecord::Migration
  def up
    add_column :master_design_uploads, :is_cover, :boolean, :default => false
  end
end
