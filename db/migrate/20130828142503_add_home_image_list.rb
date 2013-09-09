#encoding: utf-8
class AddHomeImageList < ActiveRecord::Migration
  def change
  	HomeImageList.create :title => "装修户型", :value => "home_type"	
  	HomeImageList.create :title => "装修风格", :value => "home_style"
  	HomeImageList.create :title => "装修费用", :value => "home_cost"
  	HomeImageList.create :title => "装修空间", :value => "home_space"
  	HomeImageList.create :title => "装修色彩", :value => "home_color"
  end
end
