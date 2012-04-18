class AddColumnMessageIdToReplyMsgs < ActiveRecord::Migration
  def change
    add_column :reply_msgs, :message_id, :integer
  end
end
