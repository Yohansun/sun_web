class AddFile2ToMasterDesingUploads < ActiveRecord::Migration
  def change
    add_column :master_design_uploads, :file2_file_name, :string
    add_column :master_design_uploads, :file2_content_type, :string
    add_column :master_design_uploads, :file2_file_size, :integer
    add_column :master_design_uploads, :file2_updated_at, :datetime
  end
end
