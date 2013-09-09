# encoding: utf-8
class RefreshLife::RefreshListController < RefreshLife::BaseRefreshController
  #caches_action :index, :expires_in => 30.minutes, :cache_path => Proc.new { |c| c.params }

  def index
    @i_life_infos = ILifeInfo.order("updated_at desc").page(params[:page]).per(5)
    if @i_life_infos
      if @i_life_infos.count % 5 == 0
        @page_count = @i_life_infos.count / 5
      else
        @page_count = (@i_life_infos.count / 5).to_i + 1
      end
    end
  end

end