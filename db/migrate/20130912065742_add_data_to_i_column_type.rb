#encoding: utf-8
class AddDataToIColumnType < ActiveRecord::Migration
  def change
  	IColumnType.find_by_name("精华资讯").update_attributes(:name => "刷新效果精彩资讯")
  end
end
