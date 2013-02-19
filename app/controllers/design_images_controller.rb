# -*- encoding : utf-8 -*-
class DesignImagesController < ApplicationController
  def create
    newparams = coerce(params)
    @upload = DesignImage.new(newparams[:upload])
    @upload.user_id = params[:user_id]
    if @upload.save
      flash[:notice] = "Successfully created upload."
      session[:image_id] = @upload.id
      respond_to do |format|
        format.json {render :json => { :result => 'success',
          :upload => design_image_path(@upload.id),
          :path =>  @upload.file.url(:spring_img)} }
      end
    else
      respond_to do |format|
        format.json {render :json => { :result => 'failed',
          :action => 'new' } }
      end
    end
  end

  def show
    @upload = DesignImage.find(params[:id])
  end

  def index
    @image_length = DesignImage.available.count
    @categories = ImageLibraryCategory.where(parent_id: nil).includes(:children)
    @tag_ids = params[:tags].split(",").map { |e| e.to_i }.uniq.sort unless params[:tags].blank?
    @images = DesignImage.available

    if @tag_ids
      @tags = ImageLibraryCategory.where("id in (?)", @tag_ids).all
      final_tags = @tags.map { |tag| tag.self_and_descendants }.flatten
      @images = @images.search_tags(final_tags.map(&:id))
      @tag_names = final_tags.map(&:title)
      @tag_ids.delete(-1)
    end

    unless params[:area_id].blank?
      area = Area.find(params[:area_id])
      areas = area.self_and_descendants
      area_tree = area.self_and_ancestors.map(&:id)
      @area_names = area.self_and_ancestors.map(&:name).join(" ")
      @area_level_1, @area_level_2, @area_level_3 = area_tree[0], area_tree[1], area_tree[2]
      @images = @images.where(area_id: areas.map(&:id))
    end

    unless params[:search].blank?
      @images = @images.where("title LIKE ?", "%#{params[:search]}%")
    end

    unless params[:imageable_type].blank?
      @images = @images.where("imageable_type = ?", params[:imageable_type])
    end

    unless params[:pinyin].blank?
      @images = @images.where("pinyin LIKE ?", "#{params[:pinyin]}%")
    end

    unless params[:ranking_list].blank?
      if params[:ranking_list] == "like"
        @images = @images.order("design_images.votes_count desc")
      elsif params[:ranking_list] == "view_count"
        @images = @images.order("design_images.view_count desc")
      end
    else
      @images = @images.order("design_images.created_at DESC, design_images.source DESC")
    end

    @images = @images.page(params[:page]).per(11)
    @query_params = ([@tag_names, @area_names, params[:pinyin]] - [""]).compact.join(", ")
  end

  def decoration_parts
    @image_length = DesignImage.count
    if params[:imageable_type] == "MasterDesign"
      @images = DesignImage.available.where(imageable_type: 'MasterDesign').page(params[:page]).per(11)
    elsif params[:imageable_type] == "Design"
      @images = DesignImage.available.where(imageable_type: 'Design').page(params[:page]).per(11)
    elsif params[:imageable_type] == "ColorDesign"
      @images = DesignImage.available.where(imageable_type: 'ColorDesign').page(params[:page]).per(11)
    elsif params[:ranking_list] == "like"
      @images = DesignImage.includes(:design).available.order("designs.votes_count DESC").page(params[:page]).per(11)
    elsif params[:ranking_list] == "view_count"
      @images = DesignImage.includes(:design).available.order("designs.view_count DESC").page(params[:page]).per(11)
    else
      @images = DesignImage.available.page(params[:page]).per(11)
    end
  end

  def image_show
    @image = DesignImage.includes(:design).find(params[:id])
    @image.view_count += 1
    @image.update_attributes(:view_count => @image.view_count)
    @images_total = DesignImage.available.count
    @image_tags = @image.tags.map{|a| ImageLibraryCategory.find(a.image_library_category_id).title}
    if @image.area_id
      @image_city = Area.find(@image.area_id).parent.name
    end
    #推荐色
    @image_colors = ColorCode.where("code in (?)", [@image.color1,@image.color2,@image.color3])
    @comments = @image.comments.page(params[:page]).per(3)
    #精品推荐
    @week_stars = WeeklyStar.order("created_at desc").limit(4)
    #猜你喜欢
    tags = @image.tags.map(&:image_library_category_id)
    if tags == []
      @like_images = DesignImage.available.order("created_at desc").limit(4)
    else
      tags = tags[0..4]
      @like_images = DesignImage.search_tags(tags).limit(4)
    end
  end

  def fullscreen
    @design_image = DesignImage.find(params[:id])
    render :layout => nil
  end

  def more_comment
    @image = DesignImage.find(params[:id])
    @page = params[:page].try(:to_i) +1
    @comments = @image.comments.page(@page).per(3)
  end

  private
  def coerce(params)
    if params[:upload].nil?
      h = Hash.new
      h[:upload] = Hash.new
      h[:upload][:file] = params[:Filedata]
      h[:upload][:file].content_type = MIME::Types.type_for(h[:upload][:file].original_filename).to_s
      h
    else
      params
    end
  end
end