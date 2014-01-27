class AddAttachmentEditTreasuryThumbToDialogCelebrityPage < ActiveRecord::Migration
  def self.up
    add_column :dialog_celebrity_pages, :edit_treasury_thumb_file_name, :string
    add_column :dialog_celebrity_pages, :edit_treasury_thumb_content_type, :string
    add_column :dialog_celebrity_pages, :edit_treasury_thumb_file_size, :integer
    add_column :dialog_celebrity_pages, :edit_treasury_thumb_updated_at, :datetime
    add_column :dialog_celebrity_pages, :edit_treasury_url,:string
  end

  def self.down
    remove_column :dialog_celebrity_pages, :edit_treasury_thumb_file_name
    remove_column :dialog_celebrity_pages, :edit_treasury_thumb_content_type
    remove_column :dialog_celebrity_pages, :edit_treasury_thumb_file_size
    remove_column :dialog_celebrity_pages, :edit_treasury_thumb_updated_at
    remove_column :dialog_celebrity_pages, :edit_treasury_url
  end
end