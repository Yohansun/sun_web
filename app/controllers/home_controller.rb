# -*- encoding : utf-8 -*-
class HomeController < ApplicationController
  layout "home_manage"

  caches_action :index, :expires_in => 7.days
  # before_filter :get_vote

  def t1days
    redirect_to "/21days/index.html"
  end

  def index
    #首页KV
    @home_kvs = HomeKv.includes(:kv_maps).kv_position.order("position")

    # 精华推荐
    @home_recommends = HomeRecommend.order("position")

    # 大师殿堂
    @master_profile = MasterProfile.first
    @master_designs = @master_profile.master_designs
    if @master_designs.present?
      @master_design_images = @master_designs.first.master_design_uploads
    else
      @master_design_images = []
    end

    # banner
    @owner_entry_banner = HomeBanner.find_by_banner_name "业主通道banner 290x200"
    @footer_banner_one = HomeBanner.find_by_banner_name "底部大banner 670x85"
    @footer_banner_two = HomeBanner.find_by_banner_name "底部小banner 310x85"
    @chief_banner = HomeBanner.find_by_banner_name "精华推荐banner 270x100"
    @master_banner = HomeBanner.find_by_banner_name "大师殿堂banner 1000x85"

    #装修资讯
    @fit_literals = FitLiteral.order("order_id asc")
    @fit_image = FitImage.first

    #精彩资讯
    @questions = Question.order("rank asc")

    #业主通道
    @owner_entrys = OwnerEnter.order("order_id asc")

    # design tag
    @image_tags = HomeImageLibTag.all
    @categories = ImageLibraryCategory.parent_categories
    @category_ids = @categories.collect{|categorie|
      {
        id: categorie.id,
        childs: categorie.children.collect{|c| {child_ids: c.id, child_child_ids: c.children.collect{|cc| cc.id} } }
      }
    }

    # design image
    @image_lib1 = HomeImageLibPhoto.find_by_id(1)
    @image_lib2 = HomeImageLibPhoto.find_by_id(2)
    @image_lib3 = HomeImageLibPhoto.find_by_id(3)
    @image_lib4 = HomeImageLibPhoto.find_by_id(4)
    @image_lib5 = HomeImageLibPhoto.find_by_id(5)
    @image_lib6 = HomeImageLibPhoto.find_by_id(6)
    @image_lib7 = HomeImageLibPhoto.find_by_id(7)

    # design show
    @week_star = HomeDesignShow.design_type(1)
    if @week_star.present?
      @week_star_title = @week_star.position(0).last.title
      @week_star_left = @week_star.position(1).last
      @week_star_right1 = @week_star.position(2).last
      @week_star_right2 = @week_star.position(3).last
      @week_star_right3 = @week_star.position(4).last
    end
    @design_show = HomeDesignShow.design_type(2)
    if @design_show.present?
      @design_title = @design_show.position(0).last.try(:title)
      @design_left = @design_show.position(1).last
      @design_right1 = @design_show.position(2).last
      @design_right2 = @design_show.position(3).last
      @design_right3 = @design_show.position(4).last
    end
    @color_show = HomeDesignShow.design_type(3)
    if @color_show.present?
      @color_title = @color_show.position(0).last.try(:title)
      @color_left = @color_show.position(1).last
      @color_right1 = @color_show.position(2).last
      @color_right2 = @color_show.position(3).last
      @color_right3 = @color_show.position(4).last
    end
    @banner1 = IBanner.page_name('首页').position(1).first
    @banner2 = IBanner.page_name('首页').position(7).first
    @banner3 = IBanner.page_name('首页').position(8).first
    @banner4 = IBanner.page_name('首页').position(3).first
    @banner5 = IBanner.page_name('首页').position(4).first
    @banner6 = IBanner.page_name('首页').position(5).first
    @banner7 = IBanner.page_name('首页').position(6).first
    @home_life_videos = HomeLifeVideo.order("rank asc")

    expires_in 1.day, 'max-stale' => 2.hours, :public => true
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
      render layout: nil, content_type: 'text/javascript'
  end

  def home_overall
      render layout: nil, content_type: 'text/javascript'
  end

  def image_show_loading
    render layout: nil
  end

  def image_vote
    if params[:image_id]
      @image = DesignImage.find_by_id(params[:image_id])
      render :json => {:image_vote => @image.votes_count}
    else
      render nothing: true
    end
  end

  def get_vote
    week_vote = 0
    design_vote = 0
    color_vote = 0
    @week_star = HomeDesignShow.design_type(1)
    if @week_star.present?
      @week_star_left = @week_star.position(1).last
      week_vote = @week_star_left.vote if @week_star_left
    end
    @design_show = HomeDesignShow.design_type(2)
    if @design_show.present?
      @design_left = @design_show.position(1).last
      design_vote = @design_left.vote if @design_left
    end
    @color_show = HomeDesignShow.design_type(3)
    if @color_show.present?
      @color_left = @color_show.position(1).last
      color_vote = @color_left.vote if @color_left
    end
    respond_to do |format|
      format.json {render :json => { :week_vote => week_vote, :design_vote => design_vote, :color_vote => color_vote,
        :action => 'index'
        }
      }
    end
  end

  def update_vote
    @hds = HomeDesignShow.find params[:id]
    if @hds
      if @hds.vote.present?
        @hds.vote = @hds.vote.to_i + 1
      else
        @hds.vote = 1
      end
      @hds.save
    end
  end

  def upload_img
    result = {}
    params.each do |key, value|
      if key != 'filedata'
        params.delete(key)
      end
    end
    @upload_file = UploadFile.new(params)
    if @upload_file.save
      result[:err] = ''
      result[:msg] = @upload_file.filedata.url
    else
      result[:err] = 'image'
      result[:msg] = 'upload error'
    end
    render :text => result.to_json
  end
end