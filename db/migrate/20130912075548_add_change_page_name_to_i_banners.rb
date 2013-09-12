class AddChangePageNameToIBanners < ActiveRecord::Migration
  def change
    aa = IBanner.where(page_name: '刷新生活精彩咨讯')
    aa.update_all(page_name: '刷新生活精彩资讯') if aa.any?
  end
end
