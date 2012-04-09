class CreateWeiboData < ActiveRecord::Migration
  def change
    create_table :weibo_data do |t|
      t.string :q
      t.string :img_url
      t.string :weibo_username
      t.string :weibo_content
      t.datetime :weibo_time
      t.datetime :get_at
      t.integer :status
      t.timestamps
    end
  end
end
