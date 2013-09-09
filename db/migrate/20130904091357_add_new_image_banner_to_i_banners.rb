#encoding: utf-8
class AddNewImageBannerToIBanners < ActiveRecord::Migration
  def change
  	IBanner.where(page_name: '图库内页',position: 3).first.update_attribute(:size,'670x85')
  	IBanner.create(page_name: "图库内页", position: 4, size: '310x85')
  end
end
