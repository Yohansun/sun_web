class AddReplySysMsgIdToSiteMessages < ActiveRecord::Migration
  def change
    add_column :site_messages, :sys_msg_id, :integer
  end
end
