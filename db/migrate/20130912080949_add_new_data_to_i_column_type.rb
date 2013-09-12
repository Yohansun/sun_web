#encoding: utf-8
class AddNewDataToIColumnType < ActiveRecord::Migration
  def change
  	IColumnType.find_by_name("刷新效果精彩资讯").update_attributes(:name => "精彩资讯")
  	IColumnType.find_by_name("精华推荐").update_attributes(:name => "刷新效果精彩资讯")
  end
end
