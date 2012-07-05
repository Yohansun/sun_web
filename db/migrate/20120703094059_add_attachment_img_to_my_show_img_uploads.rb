class AddAttachmentImgToMyShowImgUploads < ActiveRecord::Migration
  def self.up
    add_column :my_show_img_uploads, :img_file_name, :string
    add_column :my_show_img_uploads, :img_content_type, :string
    add_column :my_show_img_uploads, :img_file_size, :integer
    add_column :my_show_img_uploads, :img_updated_at, :datetime
  end

  def self.down
    remove_column :my_show_img_uploads, :img_file_name
    remove_column :my_show_img_uploads, :img_content_type
    remove_column :my_show_img_uploads, :img_file_size
    remove_column :my_show_img_uploads, :img_updated_at
  end
end
