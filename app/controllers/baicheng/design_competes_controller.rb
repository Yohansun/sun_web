# encoding: utf-8
class Baicheng::DesignCompetesController < ApplicationController
  layout 'baicheng'
  before_filter :find_user
  # before_filter :get_tags, :only => [:index]
  def index
     
    @title = "设计作品大比拼_展示各种风格装修设计作品-立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
    @description = "立邦iColor因爱之名刷新生活 设计作品大比拼活动，展示各种风格装修设计作品，你可以按城市、户型、风格、预算，选择适合您的装修设计图。"
    @key_words = '装修设计作品,装修风格,装修户型,装修设计图'
    @desgins = Design.baicheng.order("designs.created_at DESC")
    province_id,city_id,area_id = params[:province_id].or(nil),params[:city_id].or(nil),params[:area_id].or(nil)
    area_ids =[]
    if area_id.present?
      area_ids  = [area_id]
    elsif province_id.present?
      area_ids   = Area.robot(province_id,[city_id].compact).map(&:id)
    end
    
    unless area_ids.empty?
      Rails.logger.info area_ids
      @desgins =  @desgins.where(area_id: area_ids)
    end
    
    if params[:tag].present? 
      @desgins = @desgins.joins(:design_tags).where("design_tags.image_library_category_id = ?", params[:tag])
    end
    if params[:cost].present?
      @desgins = @desgins.joins(:design_tags).where("design_tags.image_library_category_id = ?", params[:cost])
    end
    if params[:style].present?
      @desgins = @desgins.joins(:design_tags).where("design_tags.image_library_category_id = ?", params[:style])
    end
    
    if params[:keywords].present?
      if params[:soso] == "so_user"
        @desgins = Design.baicheng.order("designs.created_at DESC").joins(:user).where("users.username=?", params[:keywords]) if params[:keywords].present?
      else
        @desgins = Design.baicheng.order("designs.created_at DESC").where("title=?", params[:keywords]) if params[:keywords].present?
      end
    end
    @designs = @desgins.joins(:cover_img).where('design_images.id is not null').page(params[:page]).per(24)
  end

  def show

    
    @design = Design.baicheng.find params[:id]
    @story_id = @design.story_id
    @story = Story.where(id: @story_id).first
    @comments = @design.comments.page(params[:page]).per(8)
    @image_colors = []  
    @design.design_images.available.each do |image|  
      @image_colors << ColorCode.where("code in (?)", [image.color1, image.color2, image.color3])  
    end      
    @title = "设计作品大比拼_#{@story.user.display_name if @story}房型设计-立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈(**为设计作品名称)"
    @description = "立邦iColor因爱之名刷新生活 设计作品大比拼活动，展示设计作品图片、楼盘名称、装修设计风格，您可以免费咨询。"
    @key_words = '设计作品名称,楼盘名称,装修设计风格'
  end
  
  def get_tags
    @tags = []
    @tags << {:title => "户型", :id => ""}
    ImageLibraryCategory.where(parent_id: 1).each do |tag|
      @tags << {title: tag.title, id: tag.id }
    end
  end

end
