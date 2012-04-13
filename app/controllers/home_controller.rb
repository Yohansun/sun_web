# -*- encoding : utf-8 -*-
class HomeController < ApplicationController
  def index
    @user = User.new
    @weibo_data = WeiboData.where(:q => "放飞色彩心愿清单").where("thumbnail_pic IS NOT NULL").order("created_time DESC").limit(18).all
  end
end
