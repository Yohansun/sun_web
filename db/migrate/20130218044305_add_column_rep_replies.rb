class AddColumnRepReplies < ActiveRecord::Migration
  def change
    add_column :rep_replies, :reply_id, :integer
  end
end
