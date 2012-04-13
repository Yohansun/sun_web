class RenameWeiboData < ActiveRecord::Migration
  def change
    rename_table :weibo_data, :weibo_items
  end
end
