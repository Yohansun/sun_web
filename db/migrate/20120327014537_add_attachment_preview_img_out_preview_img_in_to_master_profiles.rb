class AddAttachmentPreviewImgOutPreviewImgInToMasterProfiles < ActiveRecord::Migration
  def self.up
    add_column :master_profiles, :preview_img_out_file_name, :string
    add_column :master_profiles, :preview_img_out_content_type, :string
    add_column :master_profiles, :preview_img_out_file_size, :integer
    add_column :master_profiles, :preview_img_out_updated_at, :datetime
    add_column :master_profiles, :preview_img_in_file_name, :string
    add_column :master_profiles, :preview_img_in_content_type, :string
    add_column :master_profiles, :preview_img_in_file_size, :integer
    add_column :master_profiles, :preview_img_in_updated_at, :datetime
  end

  def self.down
    remove_column :master_profiles, :preview_img_out_file_name
    remove_column :master_profiles, :preview_img_out_content_type
    remove_column :master_profiles, :preview_img_out_file_size
    remove_column :master_profiles, :preview_img_out_updated_at
    remove_column :master_profiles, :preview_img_in_file_name
    remove_column :master_profiles, :preview_img_in_content_type
    remove_column :master_profiles, :preview_img_in_file_size
    remove_column :master_profiles, :preview_img_in_updated_at
  end
end
