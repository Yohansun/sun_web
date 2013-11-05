# encoding: utf-8
class Huaxun::HxNewsController < Huaxun::BaseController

  def index
    @hx_news_all = HxNews.where(["position is not null"]).order("position asc")
    @more_url = HxNews.find_by_position(nil)
  end

  def update_more_url
    if params[:more_url]
      more_url = HxNews.find_or_create_by_position(nil)
      more_url.update_attribute(:url, params[:more_url])
    end
    redirect_to hx_news_index_path, notice: '更多URL修改成功!'
  end

  def insert_first
    respond_to do |format|
      format.js
    end
  end

  def insert_save
    if params[:title] && params[:url]
      HxNews.find_each {|a| a.increment!(:position) unless a.position.nil? }
      last = HxNews.order("position").last
      last.destroy if last.present?
      HxNews.create(position: 1, title: params[:title], url: params[:url])
    end
    flash[:notice] = "新闻创建成功!"
    render js: "location.reload();"
  end

  def edit
    @hx_news = HxNews.find(params[:id])
  end

  def update_news
    if params[:id].present?
      @hx_news = HxNews.find(params[:id])
      if @hx_news.position == params[:position]
        @hx_news.update_attributes(title: params[:title], url: params[:url])
      else
        exist_news = HxNews.find_by_position(params[:position])
        exist_news.update_attribute(:position,@hx_news.position) if exist_news
        @hx_news.update_attributes(position: params[:position], title: params[:title], url: params[:url])
      end
    end
    flash[:notice] = "新闻修改成功!"
    render js: "location.reload();"
  end
end
