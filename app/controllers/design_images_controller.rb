# encoding: utf-8

# -*- encoding : utf-8 -*-
class DesignImagesController < ApplicationController
  caches_action :index, :expires_in => 30.minutes, :cache_path => Proc.new { |c| c.params }

  def create
    newparams = coerce(params)
    @upload = DesignImage.new(newparams[:upload])
    @upload.user_id = params[:user_id]
    @upload.imageable_id = params[:design_id] if params[:design_id]
    @upload.imageable_type = params[:design_type] if params[:design_type]
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

  def download
    target_file = DesignImage.find(params[:id])
      if target_file
        send_file target_file.file.path
      else
        render nothing: true, status: 404
      end
  end

  def show
    @upload = DesignImage.find(params[:id])
  end

  def index
    @content = ""
    @images = DesignImage.available.audited_with_colors
    @image_length = @images.count
    @categories = ImageLibraryCategory.where(parent_id: nil).includes(:children).order("position")
    @tag_names = []
    unless params[:tags].blank?
       @tag_ids = CGI.unescape(params[:tags]).split("-").map { |e| e.to_i }.uniq.sort
       @tag_ids.delete(-1)
    end

    unless @tag_ids.blank?
      tag_arrs = []
      @tag_ids.each do |tag_arr|
        if tag_arr.to_i != 0
          tag_arrs << tag_arr
        end
      end
      if tag_arrs.present?
        @tags = ImageLibraryCategory.where("id in (?)", tag_arrs).all
        @tags.map {|tag| @content += tag.title + "、"}
        final_tags = @tags.select{|item| !item.parent_id.blank?}.map { |tag| tag.self_and_descendants }.flatten
        @images = @images.search_tags(final_tags.map(&:id))
        @tag_names << final_tags.map(&:title)
      end
    end

    if params[:area_id].present? && params[:area_id].to_s != "0"
      area = Area.find(params[:area_id])
      @content += area.parent.name + "、"
      areas = area.self_and_descendants
      area_tree = area.self_and_ancestors.map(&:id)
      @area_names = area.self_and_ancestors.map(&:name).join(" ")
      @area_level_1, @area_level_2, @area_level_3 = area_tree[0], area_tree[1], area_tree[2]
      @images = @images.where(area_id: areas.map(&:id))
    end

    if params[:search].present? && params[:search].to_s != "_"
      tags = ImageLibraryCategory.where("title LIKE ?", "%#{params[:search]}%")
      tags.map { |tag| @content += tag.title + "、" }
      @images = @images.search_tags(tags.map(&:id), true)
      @tag_names << tags.map(&:title)
    end

    if params[:imageable_type].present? && params[:imageable_type].to_s != "all"
      if params[:imageable_type] == 'WeekStart'
        @images = @images.where("sorts = 2")
      else
        @images = @images.where("imageable_type = ?", params[:imageable_type])
      end
    end

    if params[:pinyin].present? && params[:pinyin].to_s != "0"
      tags = ImageLibraryCategory.where("pinyin LIKE ?", "#{params[:pinyin]}%")
      tags.map { |tag| @content += tag.title + "、" }
      @images = @images.search_tags(tags.map(&:id), true)
      @tag_names << tags.map(&:title)
    end

    unless params[:ranking_list].blank?
      if params[:ranking_list] == "like"
        @images = @images.order("design_images.votes_count desc")
      elsif params[:ranking_list] == "view_count"
        @images = @images.order("design_images.view_count desc")
      end
    else
      # @images = @images.order("sorts ASC, design_images.source DESC, design_images.created_at DESC")
      @images = @images.order("design_images.created_at DESC")
    end
    @images = @images.page(params[:page]).per(11)
    #use in show or other page
    @query_params = ([@tag_names, @area_names, params[:pinyin]] - [""]).compact.join(", ")
    #use in design_image index
    @query_params_index = ([@tag_names] - [""]).compact.join(", ")
    @query_params_index = @query_params_index.split(',')
    @query_tags = []
    @query_params_index.each do |tag|
      @query_tags << ImageLibraryCategory.find_by_title(tag.strip)
    end
    @image_colors = []
    @images.each do |image|
      @image_colors << ColorCode.where("code in (?)", [image.color1, image.color2, image.color3])
    end

    expires_in 30.minutes, 'max-stale' => 1.hours, :public => true
  end

  def image_tag
    image_tags_arr = []

    image_tags = ImageTag.where(design_image_id: params[:image_id], genre: 'image_tag2')
    if image_tags.present?
      image_tags.each do |image_tag|
        image_tag.destroy
      end
    end

    if params[:furniture].present?
      image_tags_arr += params[:furniture]
    end
    if params[:lamps].present?
      image_tags_arr += params[:lamps]
    end
    if params[:fabric].present?
      image_tags_arr += params[:fabric]
    end
    if params[:metope].present?
      image_tags_arr += params[:metope]
    end
    if params[:accessories].present?
      image_tags_arr += params[:accessories]
    end
    if params[:appliances].present?
      image_tags_arr += params[:appliances]
    end
    if params[:cupboard].present?
      image_tags_arr += params[:cupboard]
    end
    if params[:baths].present?
      image_tags_arr += params[:baths]
    end
    if params[:ceramic_tile].present?
      image_tags_arr += params[:ceramic_tile]
    end
    if params[:floor].present?
      image_tags_arr += params[:floor]
    end
    if params[:articles].present?
      image_tags_arr += params[:articles]
    end
    if params[:doors_windows].present?
      image_tags_arr += params[:doors_windows]
    end
    if params[:digital].present?
      image_tags_arr += params[:digital]
    end
    if params[:other].present?
      image_tags_arr += params[:other]
    end
    if image_tags_arr.present?
      image_tags_arr.each do |image_tag|
        ImageTag.create(design_image_id: params[:image_id],image_library_category_id: image_tag, genre: 'image_tag2')
      end
    end
    render :js => "window.close();"
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
    @image = DesignImage.includes(:design).includes(:tags).find(params[:id])
    if @image.imageable_type == "MasterDesign"
       @master_design = MasterDesign.find(@image.imageable_id)
    end

    @image.view_count += 1
    @image.update_attributes(:view_count => @image.view_count)
    @images_total = DesignImage.available.audited_with_colors.count
    @image_tags = ImageLibraryCategory.find(@image.tags.map(&:image_library_category_id)).map{|a| a.title}
    # @image_styles = @image.try(:design_id) && DesignTags.design_style(@image.design_id)
    if @image.area_id
      area = Area.find(@image.area_id)
      if area.parent_id
        @image_city = area.parent.name
      else
        @image_city = area.name
      end
    end
    @tag_names = []
    images = DesignImage.available.audited_with_colors
    unless params[:tags].blank?
       @tag_ids = CGI.unescape(params[:tags]).split("-").map { |e| e.to_i }.uniq.sort
       @tag_ids.delete(-1)
    end

    unless @tag_ids.blank?
      tag_arrs = []
      @tag_ids.each do |tag_arr|
        if tag_arr.to_i != 0
          tag_arrs << tag_arr
        end
      end

      if tag_arrs.present?
        @tags = ImageLibraryCategory.where("id in (?)", tag_arrs).all
        final_tags = @tags.select{|item| !item.parent_id.blank?}.map { |tag| tag.self_and_descendants }.flatten
        images = images.search_tags(final_tags.map(&:id))
        @tag_names << final_tags.map(&:title)
      end
    end

    if params[:area_id].present? && params[:area_id].to_s != "0"
      area = Area.find(params[:area_id])
      areas = area.self_and_descendants
      area_tree = area.self_and_ancestors.map(&:id)
      @area_names = area.self_and_ancestors.map(&:name).join(" ")
      @area_level_1, @area_level_2, @area_level_3 = area_tree[0], area_tree[1], area_tree[2]
      images = images.where(area_id: areas.map(&:id))
    end

    if params[:search].present? && params[:search] != '_'
      tags = ImageLibraryCategory.where("title LIKE ?", "%#{params[:search]}%")
      images = images.search_tags(tags.map(&:id), true)
      @tag_names << tags.map(&:title)
    end

    if params[:imageable_type].present? && params[:imageable_type] != "all"
      if params[:imageable_type] == 'WeekStart'
        images = images.where("sorts = 2")
      else
        images = images.where("imageable_type = ?", params[:imageable_type])
      end
    end

    if params[:pinyin].present? && params[:pinyin].to_i != 0
      tags = ImageLibraryCategory.where("pinyin LIKE ?", "#{params[:pinyin]}%")
      images = images.search_tags(tags.map(&:id), true)
      @tag_names << tags.map(&:title)
    end

    if params[:ranking_list].present? && params[:ranking_list].to_i != 0
      if params[:ranking_list] == "like"
        images = images.order("design_images.votes_count desc")
      elsif params[:ranking_list] == "view_count"
        images = images.order("design_images.view_count desc")
      end
    else
      images = images.order("design_images.created_at DESC")
    end
    if params[:pinyin].present? && params[:pinyin].to_i != 0
      @query_params = ([@tag_names, @area_names, params[:pinyin]] - [""]).compact.join(", ")
    else
      @query_params = ([@tag_names, @area_names]).compact.join(", ")
    end
    count = images.count
    site = params[:site].to_i - 1
    @up_id = images.offset(site - 1).limit(1) if (site + 1) > 1
    @next_id = images.offset(site + 1).limit(1) if (site + 1) < count

    # #获取图片第几张
    # @images = []
    # @image_num = 1
    # if @image.imageable_type == 'MasterDesign'
    #   mdu = MasterDesign.find @image.imageable_id
    #   @images = DesignImage.where("imageable_id = #{mdu.id} and imageable_type = 'MasterDesign'")
    # end
    # if @image.imageable_type == 'Design'
    #   @images = @image.design.design_images
    # end
    # @images.each do |image|
    #   if image.id.to_i == @image.id.to_i
    #     break
    #   else
    #     @image_num += 1
    #   end
    # end

    #推荐色
    @image_colors = ColorCode.where("code in (?)", [@image.color1,@image.color2,@image.color3])
    @comments = @image.comments.page(params[:page]).per(3)
    #精品推荐
    @week_stars = WeeklyStar.order("created_at desc").limit(4)
    #猜你喜欢
    tags = @image.tags.map(&:image_library_category_id)
    if tags == []
      @like_images = DesignImage.available.audited_with_colors.order("created_at desc").uniq.limit(4)
    else
      tags = tags[0..4]
      @like_images = DesignImage.available.audited_with_colors.search_tags(tags, true).uniq.limit(4)
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
