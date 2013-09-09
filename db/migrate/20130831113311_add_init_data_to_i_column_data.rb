#encoding: utf-8
class AddInitDataToIColumnData < ActiveRecord::Migration
  def change
  	IColumnType.create :name => "最新大师作品"
  	IColumnType.create :name => "装修图库精选"
  	IColumnType.create :name => "设计之星作品精选"
  	IColumnType.create :name => "装修效果图精华推荐"
  	IColumnType.create :name => "本周最热装修设计"
  	IColumnType.create :name => "大师访谈"
  	IColumnType.create :name => "相关资讯"
  	IColumnType.create :name => "装修资讯精选"
  	IColumnType.create :name => "装修色彩配搭"
  	IColumnType.create :name => "装修户型排行榜"
  	IColumnType.create :name => "装修风格排行榜"
  	IColumnType.create :name => "装修费用排行榜"
  	IColumnType.create :name => "装修空间排行榜"
  	IColumnType.create :name => "装修色彩排行榜"
  	IColumnType.create :name => "热门家装公司推荐"
  	IColumnType.create :name => "精华推荐"
  	IColumnType.create :name => "精华资讯"
  end
end
