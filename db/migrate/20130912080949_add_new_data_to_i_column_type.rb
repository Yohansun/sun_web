#encoding: utf-8
class AddNewDataToIColumnType < ActiveRecord::Migration
  def change
    #这个修改不能用。你只修改了数据名称。但是前台取得数据都没有变。这样你就还要修改前台取数据的逻辑。
  	# IColumnType.find_by_name("刷新效果精彩资讯").update_attributes(:name => "精彩资讯")
  	# IColumnType.find_by_name("精华推荐").update_attributes(:name => "刷新效果精彩资讯")
  end
end
