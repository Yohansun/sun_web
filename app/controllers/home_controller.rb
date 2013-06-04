# -*- encoding : utf-8 -*-
class HomeController < ApplicationController
  caches_page :index, :expires_in => 60.minutes

  def t1days
    redirect_to "/21days/index.html"
  end

  def index
    # @weibo_data = WeiboItem.where("thumbnail_pic IS NOT NULL AND status = 1").order("created_time DESC").limit(18)

    #每周之星
    @weekly_star = WeeklyStar.order("published_at desc").first
    design_id = @weekly_star.design_link.split("/").last
    @link_design = Design.find_by_id(design_id)

    #家装资讯
    # @home_infos = Subject.content("articles").limit(3)

    #大师访谈
    @master_interview = MasterProfile.first

    #热点话题
    # @hot_topic = Subject.content("master_topics").first  || Post.new

    #大师作品
    @master_designs = MasterDesign.order("updated_at desc").limit(3)
    @master_design = @master_designs[0]
    @master_design_two = @master_designs[1]
    @master_design_three = @master_designs[2]

    #图库装修
    @design_images = DesignImage.available.audited_with_colors.order("created_at desc").limit(6)
    @design_image = @design_images[0]
    @design_image_two = @design_images[1]
    @design_image_three = @design_images[2]
    @design_image_four = @design_images[3]
    @design_image_five = @design_images[4]
    @design_image_six = @design_images[5]

    #TODO灵感秀
    @inspiration = Inspiration.joins(:design_images).last

    #推荐作品
    # @designs = Design.includes(:design_images).limit(36)
    sort_input = MagicSetting.recommend_designs
    @design = Design.joins(:design_images).order("design_images.created_at desc").first

    #色彩搭配
    @color_design = Subject.content("color_designs").last

    #行业资讯
    @articles = Subject.content("articles").limit(5)

    #生活小贴士
    @weekly_tip = WeeklyTip.order("created_at desc").limit(2)
    # @body = weekly_tip.body.split("\r\n\r\n")

    @articles = Subject.content("articles").page(params[:page]).per(6)

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
end