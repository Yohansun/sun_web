class AddReUrlToSysMsg < ActiveRecord::Migration
  def change
  	add_column :sys_msgs, :re_url, :string
  end
end
