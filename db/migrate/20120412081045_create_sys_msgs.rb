class CreateSysMsgs < ActiveRecord::Migration
  def change
    create_table :sys_msgs do |t|
      t.string :reply_name
      t.text :content
      t.integer :reply_type
      t.integer :reply_id
      t.timestamps
    end
  end
end
