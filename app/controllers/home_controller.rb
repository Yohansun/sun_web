# -*- encoding : utf-8 -*-
class HomeController < ApplicationController
  layout "home_manage"
  caches_page :index, :expires_in => 60.minutes

  def t1days
    redirect_to "/21days/index.html"
  end

  def index
    # banner
    @owner_entry_banner = HomeBanner.find_by_banner_name "业主通道banner 290x200" 
    @footer_banner_one = HomeBanner.find_by_banner_name "底部大banner 670x85"
    @footer_banner_two = HomeBanner.find_by_banner_name "底部小banner 310x85"
    @chief_banner = HomeBanner.find_by_banner_name "精华推荐banner 270x100"
    @master_banner = HomeBanner.find_by_banner_name "大师殿堂banner 1000x85"
    
    #装修资讯
    @fit_literals = FitLiteral.order("order_id asc")
    @fit_image = FitImage.first

    #业主通道
    @owner_entrys = OwnerEnter.order("order_id asc")

    expires_in 60.minutes, 'max-stale' => 2.hours, :public => true
  end

  def search
    params[:search_word] = params[:search_word].encode("utf-8", :undef => :replace, :invalid => :replace, :replace => "*").encode("utf-8")
    case params[:qt]
    when "0", "1"
      @results = Post.where("title like ?", "%#{params[:search_word]}%").page params[:page]
    when "2"
      @results = Design.where("title like ?", "%#{params[:search_word]}%").page params[:page]
    when "3"
      @results = User.where("username like ? or name like ? or name_of_company like ?", "%#{params[:search_word]}%", "%#{params[:search_word]}%", "%#{params[:search_word]}%").where("role_id = 1 or role_id = 2").page params[:page]
    end
  end

  def overall
      render layout: nil
  end

  def home_overall
      render layout: nil
  end
end