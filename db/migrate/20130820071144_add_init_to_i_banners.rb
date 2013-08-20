#encoding: utf-8
class AddInitToIBanners < ActiveRecord::Migration
  def change
  	IBanner.create(page_name: "设计快查", position: 1, size: '1000x85')
  	IBanner.create(page_name: "设计快查", position: 2, size: '670x85')
  	IBanner.create(page_name: "设计快查", position: 3, size: '310x85')
  end
end
