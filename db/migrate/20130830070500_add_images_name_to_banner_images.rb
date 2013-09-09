#encoding: utf-8
class AddImagesNameToBannerImages < ActiveRecord::Migration
  def self.up
  	IBanner.create(page_name: "图库首页", position: 1, size: '1000x85')
  	IBanner.create(page_name: "图库首页", position: 2, size: '230x230')
  	IBanner.create(page_name: "图库首页", position: 3, size: '230x170')
  	IBanner.create(page_name: "图库首页", position: 4, size: '670x85')
  	IBanner.create(page_name: "图库首页", position: 5, size: '310x85')
  	IBanner.create(page_name: "图库首页", position: 6, size: '1000x85')
  	IBanner.create(page_name: "图库首页", position: 7, size: '670x85')
  	IBanner.create(page_name: "图库首页", position: 8, size: '310x85')

  	IBanner.create(page_name: "图库列表页", position: 1, size: '230x230')
  	IBanner.create(page_name: "图库列表页", position: 2, size: '1000x85')

  	IBanner.create(page_name: "图库内页", position: 1, size: '1000x85')
  	IBanner.create(page_name: "图库内页", position: 2, size: '230x230')
  	IBanner.create(page_name: "图库内页", position: 3, size: '1000x85')
  end

  def self.down
  	IBanner.where(page_name: ['图库首页','图库列表页','图库内页']).destroy_all
  end
end
