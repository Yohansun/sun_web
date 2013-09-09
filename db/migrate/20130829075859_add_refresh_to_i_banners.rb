#encoding: utf-8
class AddRefreshToIBanners < ActiveRecord::Migration
  def self.up
  	IBanner.create(page_name: "刷新实录", position: 1, size: '230x230')
  	IBanner.create(page_name: "刷新实录", position: 2, size: '230x170')
  	IBanner.create(page_name: "刷新实录", position: 3, size: '230x230')
  	IBanner.create(page_name: "刷新实录", position: 4, size: '670x85')
  	IBanner.create(page_name: "刷新实录", position: 5, size: '310x85')

  	IBanner.create(page_name: "刷新实录视频页", position: 1, size: '670x85')
  	IBanner.create(page_name: "刷新实录视频页", position: 2, size: '230x230')
  	IBanner.create(page_name: "刷新实录视频页", position: 3, size: '670x85')
  	IBanner.create(page_name: "刷新实录视频页", position: 4, size: '310x85')

  	IBanner.create(page_name: "刷新生活精彩咨讯", position: 1, size: '230x230')
  	IBanner.create(page_name: "刷新生活精彩咨讯", position: 2, size: '230x170')
  	IBanner.create(page_name: "刷新生活精彩咨讯", position: 3, size: '230x230')
  	IBanner.create(page_name: "刷新生活精彩咨讯", position: 4, size: '670x85')
  	IBanner.create(page_name: "刷新生活精彩咨讯", position: 5, size: '310x85')

  	IBanner.create(page_name: "刷新效果", position: 1, size: '230x230')
  	IBanner.create(page_name: "刷新效果", position: 2, size: '670x85')
  	IBanner.create(page_name: "刷新效果", position: 3, size: '310x85')

  	IBanner.create(page_name: "刷新服务", position: 1, size: '670x85')
  	IBanner.create(page_name: "刷新服务", position: 2, size: '310x85')
  	IBanner.create(page_name: "刷新服务", position: 3, size: '670x85')
  end

  def self.down
  	IBanner.where(page_name: ['刷新实录','刷新实录视频页','刷新生活精彩咨讯','刷新效果','刷新服务']).destroy_all
  end
end
