class AddSiteMessageIdToSysMsg < ActiveRecord::Migration
  def change
  	add_column :sys_msgs, :site_message_id, :integer
  end
end
