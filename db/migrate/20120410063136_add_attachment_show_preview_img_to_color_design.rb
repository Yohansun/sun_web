class AddAttachmentShowPreviewImgToColorDesign < ActiveRecord::Migration
  def self.up
    add_column :color_designs, :show_preview_img_file_name, :string
    add_column :color_designs, :show_preview_img_content_type, :string
    add_column :color_designs, :show_preview_img_file_size, :integer
    add_column :color_designs, :show_preview_img_updated_at, :datetime
  end

  def self.down
    remove_column :color_designs, :show_preview_img_file_name
    remove_column :color_designs, :show_preview_img_content_type
    remove_column :color_designs, :show_preview_img_file_size
    remove_column :color_designs, :show_preview_img_updated_at
  end
end
