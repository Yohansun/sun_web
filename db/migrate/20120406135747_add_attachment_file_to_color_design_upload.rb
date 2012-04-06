class AddAttachmentFileToColorDesignUpload < ActiveRecord::Migration
  def self.up
    add_column :color_design_uploads, :file_file_name, :string
    add_column :color_design_uploads, :file_content_type, :string
    add_column :color_design_uploads, :file_file_size, :integer
    add_column :color_design_uploads, :file_updated_at, :datetime
  end

  def self.down
    remove_column :color_design_uploads, :file_file_name
    remove_column :color_design_uploads, :file_content_type
    remove_column :color_design_uploads, :file_file_size
    remove_column :color_design_uploads, :file_updated_at
  end
end
