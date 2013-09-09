# -*- encoding : utf-8 -*-
class AddCategoryToTagSorts < ActiveRecord::Migration
  def change
  	TagSort.create :category_id => 1, :title => "按户型", :genre => 1
  	TagSort.create :category_id => 366, :title => "局部空间", :genre => 1
  	TagSort.create :category_id => 82, :title => "按空间", :genre => 1
  	TagSort.create :category_id => 28, :title => "按面积", :genre => 1
  	TagSort.create :category_id => 34, :title => "按风格", :genre => 1
  	TagSort.create :category_id => 62, :title => "按调性", :genre => 1
  	TagSort.create :category_id => 19, :title => "按费用", :genre => 1
  	TagSort.create :category_id => 107, :title => "按色彩", :genre => 1
  	TagSort.create :category_id => 122, :title => "按用途", :genre => 1
  	TagSort.create :category_id => 127, :title => "按人群", :genre => 1
  	TagSort.create :category_id => 132, :title => "按图片", :genre => 1
  	TagSort.create :category_id => 'area', :title => "按地区", :genre => 1
  	TagSort.create :category_id => 211, :title => "家具", :genre => 0
  	TagSort.create :category_id => 212, :title => "灯具", :genre => 0
  	TagSort.create :category_id => 213, :title => "布艺", :genre => 0
  	TagSort.create :category_id => 214, :title => "漆面", :genre => 0
  	TagSort.create :category_id => 215, :title => "饰品", :genre => 0
  	TagSort.create :category_id => 216, :title => "家电", :genre => 0
  	TagSort.create :category_id => 217, :title => "橱柜", :genre => 0
  	TagSort.create :category_id => 218, :title => "卫浴", :genre => 0
  	TagSort.create :category_id => 219, :title => "瓷砖", :genre => 0
  	TagSort.create :category_id => 220, :title => "地板", :genre => 0
  	TagSort.create :category_id => 221, :title => "用品", :genre => 0
  	TagSort.create :category_id => 222, :title => "门窗", :genre => 0
  	TagSort.create :category_id => 223, :title => "数码", :genre => 0
  	TagSort.create :category_id => 224, :title => "其他", :genre => 0
  end
end