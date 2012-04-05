class AddAttachmentImgToFaq < ActiveRecord::Migration
  def self.up
    add_column :faqs, :img_file_name, :string
    add_column :faqs, :img_content_type, :string
    add_column :faqs, :img_file_size, :integer
    add_column :faqs, :img_updated_at, :datetime
  end

  def self.down
    remove_column :faqs, :img_file_name
    remove_column :faqs, :img_content_type
    remove_column :faqs, :img_file_size
    remove_column :faqs, :img_updated_at
  end
end
