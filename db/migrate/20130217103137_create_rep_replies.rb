class CreateRepReplies < ActiveRecord::Migration
  def change
    create_table :rep_replies do |t|
      t.integer :user_id
      t.integer :comment_id
      t.string :reply_type
      t.integer :source_reply_id
      t.string :content

      t.timestamps
    end
  end
end
