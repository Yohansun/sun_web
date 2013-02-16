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
    design_id = @weekly_star.design_link.split("/").last
    @link_design = Design.find(design_id)

    #家装资讯
    @home_infos = Subject.content("articles").limit(3)

    #大师访谈
    @master_interview = MasterProfile.first

    #热点话题
    @hot_topic = Subject.content("master_topics").first  || Post.new

    #大师作品
    @master_design = MasterDesign.order("updated_at desc").limit(1).first
    @master_design_two = MasterDesign.order("updated_at desc").limit(2).last
    @master_design_three = MasterDesign.order("updated_at desc").limit(3).last

    #图库装修
    @desing_image = DesignImage.available.order("created_at desc").limit(1).first
    @desing_image_two = DesignImage.available.order("created_at desc").limit(2).last
    @desing_image_three = DesignImage.available.order("created_at desc").limit(3).last
    @desing_image_four = DesignImage.available.order("created_at desc").limit(4).last
    @desing_image_five = DesignImage.available.order("created_at desc").limit(5).last
    @desing_image_six = DesignImage.available.order("created_at desc").limit(6).last

    #TODO灵感秀
    @inspiration = Inspiration.joins(:design_images).group("inspirations.id").where("design_images.imageable_id = inspirations.id").order("inspirations.created_at desc").first

    #推荐作品
    # @designs = Design.includes(:design_images).limit(36)
    sort_input = MagicSetting.recommend_designs
    @design = Design.order("designs.id in (#{sort_input}) desc").joins(:design_images).order("design_images.created_at desc").first

    #色彩搭配
    @color_design = Subject.content("color_designs").order("created_at desc").first

    #行业资讯
    @articles = Subject.content("articles").limit(5)

    #生活小贴士
    weekly_tip = WeeklyTip.order("created_at desc").first
    @body = weekly_tip.body.split("\r\n\r\n")

    @articles = Subject.content("articles").page(params[:page]).per(6)
    
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
