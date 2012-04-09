class AddFieldsToSiteMessages < ActiveRecord::Migration
  def change
    add_column :site_messages, :user_id, :integer
    add_column :site_messages, :title, :string
  end
end
