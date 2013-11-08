# encoding: utf-8
class HuaxunHomesController < ApplicationController
  def index
    # 华浔banner
    @banner1,@banner2 = IBanner.page_name('华浔品味装饰').where(position: [1,2]).group(:position)
    # 走进华浔
    @hx_profile = HxProfile.first
    # 华浔新闻
    @more_url = HxNews.find_by_position(nil)
    @hx_news_all = HxNews.positions.order("position asc")
    # 华浔KV
    @hx_kvs = HxKv.includes(:hx_maps).order("position asc")
    # 服务热线
    @phone = Phone.first
    # 案例赏析
    if params[:choice]
      @examples = Example.where(is_save: true, choice: true).order("top desc").order("updated_at desc").page(params[:example_page]).per(6)
    else
      @examples = Example.where(is_save: true).order("top desc").order("updated_at desc").page(params[:example_page]).per(6)
    end

    @point_gifts = PointGift.page(params[:page]).per(8)
    @point_products = PointProduct.all
    @middle_value = @point_products.count / 2
    @replies = Reply.where(genre: 'huaxun').order("id desc").page(1).limit(4)
    @teams = Team.where(is_save: true).order("updated_at desc")
  end

  def get_reply
    @replies = Reply.where(genre: 'huaxun').order("id desc").page(params[:page]).per(4)
  end

  def new_ask
    if current_user
      rep = Reply.new
      rep.reply_user_id = current_user.id
      rep.genre = "huaxun"
      rep.content = params[:content]
      rep.save
    end
    redirect_to huaxun_homes_path
  end

  def new_rep
    if current_user
      rep = RepReply.new
      rep.user_id = current_user.id
      rep.reply_id = params[:reply_id]
      rep.content = params[:content]
      rep.save
    end
    redirect_to huaxun_homes_path
  end
end
