# -*- encoding : utf-8 -*-
class HomeController < ApplicationController

  def t1days
    redirect_to "/21days/index.html"
  end

  def index

    #在cookies中添加首页layer显示
    if cookies[:homepage_guide_layer_showed].blank?
      cookies.permanent[:homepage_guide_layer_showed] = false
    end

    @weibo_data = WeiboItem.where("thumbnail_pic IS NOT NULL AND status = 1").order("created_time DESC").limit(18)

    #每周之星
    @weekly_star = WeeklyStar.order("published_at desc").first

    #家装资讯
    @home_infos = Subject.content("articles").limit(3)

    #大师访谈
    @master_interview = MasterProfile.first

    #热点话题
    @hot_topic = Subject.content("master_topics").first  || Post.new

    #大师作品
    @master_design = MasterDesign.first

    #TODO灵感秀
    @inspirations = Inspiration.includes(:design_images).limit(27).order("created_at desc")

    #推荐作品
    @designs = Design.includes(:design_images).limit(36)

    #行业资讯
    @articles = Subject.content("articles").limit(5)
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
end
