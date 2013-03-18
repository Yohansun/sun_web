# encoding: utf-8
class Baicheng::DesignWorksController < ApplicationController
	layout 'baicheng'

  def index

    case params[:mode]
      when "grid"
        @title = "刷新百城作品展示-立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
        @description = "立邦icolor刷新百城设计案例征集评选活作品展示。"
      else
        @title = "刷新百城设计师作品展示-立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
        @description = "立邦icolor刷新百城设计案例征集评选活作品展示。全国设计师作品分布。"
    end
    if params[:mode]
      @event_data = if params[:search_area] == "other"
                      baicheng_location = Rails.cache.read(:baicheng_location)
                      without_area_ids = baicheng_location["area"][params[:search_province].to_i].split(",")
                      BaichengEvent.search_areas(params[:search_province],without_area_ids).page(params[:page]).per(28)
                    elsif params[:search_area].present?
                      BaichengEvent.search_by_area(params[:search_area]).page(params[:page]).per(28)
                    else
                      BaichengEvent.scoped.order('created_at DESC').page(params[:page]).per(28)
                    end
    else
      @xx = BaichengEvent.story_type(825)
      @xx2 = BaichengEvent.design_type(825)
      @lf = BaichengEvent.story_type(647)
      @lf2 = BaichengEvent.design_type(647)
      @dt = BaichengEvent.story_type(1046)
      @dt2 = BaichengEvent.design_type(1046)
      @sjz = BaichengEvent.story_type(661)
      @sjz2 = BaichengEvent.design_type(661)
      @ly = BaichengEvent.story_type(855)
      @ly2 = BaichengEvent.design_type(855)
      # @cd = BaichengEvent.story_type(746)
      # @cd2 = BaichengEvent.design_type(746)
      # @ty = BaichengEvent.story_type(1000)
      # @ty2 = BaichengEvent.design_type(1000)
      # @ay = BaichengEvent.story_type(873)
      # @ay2 = BaichengEvent.design_type(873)

    end
    @all_style_ids = ImageLibraryCategory.where(parent_id: 34).map(&:id)
    @search_province = params[:search_province]
    @search_area = params[:search_area]
  end

  def opus
    @event_data = BaichengEvent.by_type(Design.name).order('created_at DESC').page(params[:page]).per(28)
    @xx = BaichengEvent.baicheng_map_design(825)
    @lf = BaichengEvent.baicheng_map_design(647)
    @dt = BaichengEvent.baicheng_map_design(1046)
    @sjz = BaichengEvent.baicheng_map_design(661)
    @ly = BaichengEvent.baicheng_map_design(855)
    @all_style_ids = ImageLibraryCategory.where(parent_id: 34).map(&:id)
  end

  def new
  end

  def show
    @title = "上传刷新感言和爱情故事-立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
    @description = "上传立邦icolor刷新百城设计案例征集评选活动刷新感言和爱情故事。"

  	@design = Design.find(params[:id])
  	@design_images = @design.design_images.available
  	@image_colors = []
  	@design_images.each do |image|
  		@image_colors << ColorCode.where("code in (?)", [image.color1, image.color2, image.color3])
  	end
  	@comments = @design.comments.page(params[:page]).per(4)

    ilc = ImageLibraryCategory.where(parent_id: 34).map(&:id)
    design_tags = DesignTags.where(image_library_category_id: ilc,design_id: @design.id) if @design
    @style_ids = design_tags.map(&:image_library_category_id)
  end
end
