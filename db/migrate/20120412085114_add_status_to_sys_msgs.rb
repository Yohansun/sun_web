class AddStatusToSysMsgs < ActiveRecord::Migration
  def change
    add_column :sys_msgs, :status, :integer  #0未读
    add_column :sys_msgs, :user_id, :integer #收信人id
  end
end
