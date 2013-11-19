# encoding: utf-8
class WinningsController < ApplicationController
  def index
    i_banners = IBanner.page_name('因爱设计师获奖名单')
    @banner1 = i_banners.find_by_position(1)
    @banner7 = i_banners.find_by_position(2)
    @banner8 = i_banners.find_by_position(3)
    @visual = Winning.where("name in ('童淼','王虎')")
    @color = Winning.where("name in ('张守义','刘进')")
    @space = Winning.where("name in ('蒋奇肱','李志成')")
    @special = Winning.where(genre: "special").order("id asc").page(1).limit(6)
    @network = Winning.where(genre: "network").order("id asc").page(1).limit(6)
  end

  def get_special
    @special = Winning.where(genre: "special").order("id asc").page(params[:page]).per(6)
  end

  def get_network
    @network = Winning.where(genre: "network").order("id asc").page(params[:page]).per(6)
  end
end
