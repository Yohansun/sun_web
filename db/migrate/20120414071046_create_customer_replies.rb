class CreateCustomerReplies < ActiveRecord::Migration
  def change
    create_table :customer_replies do |t|
      t.integer :user_id
      t.integer :question_id
      t.string  :question_type
      t.text    :reply_content
      t.integer :reply_id
      t.timestamps
    end
  end
end
