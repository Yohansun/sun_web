# encoding: utf-8
class RefreshLife::RefreshShowController < RefreshLife::BaseRefreshController

  def index
	@i_banner1 = IBanner.page_name("刷新效果").position(1).first
	@i_banner2 = IBanner.page_name("刷新效果").position(2).first
	@i_banner3 = IBanner.page_name("刷新效果").position(3).first
  end
end
