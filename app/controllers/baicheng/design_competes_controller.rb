# encoding: utf-8
class Baicheng::DesignCompetesController < ApplicationController
  layout 'baicheng'
  before_filter :find_user
  # before_filter :get_tags, :only => [:index]
  def index
     
    
    @desgins = Design.baicheng.includes(:cover_img).order("created_at DESC")
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
        @desgins = Design.baicheng.includes(:cover_img).order("created_at DESC").joins(:user).where("users.username=?", params[:keywords]) if params[:keywords].present?
      else
        @desgins = Design.baicheng.includes(:cover_img).order("created_at DESC").where("title=?", params[:keywords]) if params[:keywords].present?
      end
    end
    @designs = @desgins.page(params[:page]).per(24)
  end

  def show
    @design = Design.baicheng.find params[:id]
    @story_id = @design.story_id
    @story = Story.where(id: @story_id).first
    @comments = @design.comments.page(params[:page]).per(8)
  end

 

  def get_tags
    @tags = []
    @tags << {:title => "户型", :id => ""}
    ImageLibraryCategory.where(parent_id: 1).each do |tag|
      @tags << {title: tag.title, id: tag.id }
    end
  end

end
