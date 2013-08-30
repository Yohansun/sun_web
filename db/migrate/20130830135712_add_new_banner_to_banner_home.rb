#encoding: utf-8
class AddNewBannerToBannerHome < ActiveRecord::Migration
  def self.up
  	IBanner.create(page_name: "首页", position: 7, size: '240x170')
  	IBanner.create(page_name: "首页", position: 8, size: '230x170')
  end

  def self.down
  	IBanner.where(page_name: '首页',position: [7,8]).destroy_all
  end
end
