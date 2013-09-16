# encoding: utf-8
class RefreshLife::RefreshListController < RefreshLife::BaseRefreshController
  #caches_action :index, :expires_in => 30.minutes, :cache_path => Proc.new { |c| c.params }

  def index
    #list页面的banner
    @list_banners = IBanner.page_name('刷新生活精彩资讯')
    @list_banner1 = @list_banners.find_by_position(1)
    @list_banner2 = @list_banners.find_by_position(2)
    @list_banner3 = @list_banners.find_by_position(3)
    @list_banner4 = @list_banners.find_by_position(4)
    @list_banner5 = @list_banners.find_by_position(5)

    @i_life_infos = Post.where(subject_id: 1).order("updated_at desc").page(params[:page]).per(5)
    if @i_life_infos
      if @i_life_infos.count % 5 == 0
        @page_count = @i_life_infos.count / 5
      else
        @page_count = (@i_life_infos.count / 5).to_i + 1
      end
    end
  end

  def show
    @article = Post.find params[:id]
  end

end