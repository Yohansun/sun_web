class ChangeColumnReplyTypeOfSysMsgs < ActiveRecord::Migration
  def change
    remove_column :sys_msgs, :reply_type
    add_column :sys_msgs, :reply_type, :string
  end
end
