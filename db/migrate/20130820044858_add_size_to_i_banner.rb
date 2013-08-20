#encoding: utf-8
class AddSizeToIBanner < ActiveRecord::Migration
  def change
  	add_column :i_banners, :size, :string

  	IBanner.create(page_name: "首页", position: 1, size: '270x100')
  	IBanner.create(page_name: "首页", position: 2, size: '1000x85')
  	IBanner.create(page_name: "首页", position: 3, size: '1000x85')
  	IBanner.create(page_name: "首页", position: 4, size: '290x200')
  	IBanner.create(page_name: "首页", position: 5, size: '670x85')
  	IBanner.create(page_name: "首页", position: 6, size: '310x85')
  end
end
