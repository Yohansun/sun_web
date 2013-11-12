# encoding: utf-8
class HuaxunHomesController < ApplicationController
  def index
    @banner1,@banner2 = IBanner.page_name('华浔品味装饰').where(position: [1,2]).group(:position)
    @point_gifts = PointGift.page(params[:page]).per(8)
    @point_products = PointProduct.all
    @middle_value = @point_products.count / 2
    @replies = Reply.where(genre: 'huaxun').order("id desc").page(1).limit(4)
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
