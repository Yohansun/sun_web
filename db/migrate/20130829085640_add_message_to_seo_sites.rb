# -*- encoding : utf-8 -*-
class AddMessageToSeoSites < ActiveRecord::Migration
  def change
    SeoSite.create :rank => 1, :title => "欧式", :link => "http://www.icolor.com.cn", :genre => 1
    SeoSite.create :rank => 2, :title => "小户型", :link => "http://www.icolor.com.cn", :genre => 1
    SeoSite.create :rank => 3, :title => "客厅", :link => "http://www.icolor.com.cn", :genre => 1
    SeoSite.create :rank => 4, :title => "阳台", :link => "http://www.icolor.com.cn", :genre => 1
    SeoSite.create :rank => 5, :title => "粉红色系", :link => "http://www.icolor.com.cn", :genre => 1
    SeoSite.create :rank => 6, :title => "豪华", :link => "http://www.icolor.com.cn", :genre => 1
    SeoSite.create :rank => 7, :title => "纯白色系", :link => "http://www.icolor.com.cn", :genre => 1
    SeoSite.create :rank => 8, :title => "婚房装修", :link => "http://www.icolor.com.cn", :genre => 1
    SeoSite.create :rank => 1, :title => "欧式", :link => "http://www.icolor.com.cn", :genre => 0
    SeoSite.create :rank => 2, :title => "小户型", :link => "http://www.icolor.com.cn", :genre => 0
    SeoSite.create :rank => 3, :title => "客厅", :link => "http://www.icolor.com.cn", :genre => 0
    SeoSite.create :rank => 4, :title => "阳台", :link => "http://www.icolor.com.cn", :genre => 0
    SeoSite.create :rank => 5, :title => "粉红色系", :link => "http://www.icolor.com.cn", :genre => 0
  end
end
