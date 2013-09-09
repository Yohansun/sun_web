class CreateChannelTips < ActiveRecord::Migration
  def change
    create_table :channel_tips do |t|
      t.integer :rank
      t.string :title
      t.string :content
      t.string :link
      t.integer :admin_id
      t.timestamps
    end
  end
end
