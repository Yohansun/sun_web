# encoding: utf-8
require 'zip/zip'
class DesignsController < ApplicationController
  before_filter :find_user
  before_filter :find_design, :only => [:upload, :edit]

  def download
    target_file = DesignImage.where(:imageable_id => params[:id])
    zipfile_name = "#{Rails.root}/public/design#{params[:id]}.zip"
    if File.exists?(zipfile_name)
      send_file zipfile_name
    else
      Zip::ZipFile.open(zipfile_name, Zip::ZipFile::CREATE) do |zipfile|
        target_file.each do |filename|
          zipfile.add(filename.file_file_name, filename.file.path) if File.exists?(filename.file.path)
        end
      end
      send_file zipfile_name
    end
  end

  def index
    sort_input = MagicSetting.recommend_designs
    if @user
      @designs = @user.designs.order("designs.id in (#{sort_input}) desc").order("created_at desc").includes(:design_images).page(params[:page])

      load_skin
    else
      @designs = Design.order("designs.id in (#{sort_input}) desc").includes(:design_images).page(params[:page]).per(9)
    end
    unless @designs.nil?
      if params[:order] == "最热"
        @designs = @designs.order("votes_count desc")
      elsif params[:order] == "未来之星"
        @designs = @designs.where(future_star_active: true)
      elsif params[:q] == "super_refresh"
        @designs = @designs.where(is_refresh: true).order("created_at desc")
      else
        @designs = @designs.order("created_at desc")
      end
      style = "%#{params[:style]}%"
      design_color = "%#{params[:design_color]}%"
      @designs = @designs.where("style like ?", style) if params[:style] && !params[:style].blank? && params[:style] !='风格'
      @designs = @designs.where("design_color like ?", design_color) if params[:design_color] && !params[:design_color].blank? && params[:design_color] !='色系'
      @designs = @designs.where(:room_type => params[:room_type]) if params[:room_type] && !params[:room_type].blank? && params[:room_type] !='户型'
      if params[:area_id] && !params[:area_id].blank?
        @designs = @designs.where(:area_id => params[:area_id])
      elsif params[:area_head] && !params[:area_head].blank?
        area = Area.where(parent_id: params[:area_head])
        @designs = @designs.where("designs.area_id in (#{area.map(&:id).join(',')})")
      end
    end
    sign_in(@user) if current_admin && @user
  end

  def fullscreen
    @design = @user.designs.find(params[:id])
    @design_next = Design.includes(:design_images).where("designs.id > ? and design_images.file_file_size > ?", params[:id], 0).first
    render :layout => nil
  end

  def show
    @design = Design.find(params[:id])
    @comments = @design.comments.page params[:page]
    if params[:image_id]
      @image = DesignImage.find(params[:image_id])
    end
  end

  def new
    if current_user.present?
      @design = current_user.designs.new
    else
      redirect_to '/'
    end
  end

  def edit_design
    if current_user.present?
      if params[:id]
        @design = current_user.designs.find(params[:id])
        @design_tags = DesignTags.where(design_id: params[:id]).map &:image_library_category_id
      end
    else
      redirect_to '/'
    end
  end

  def design_image_tags
    @image_tags = ImageTag.where(design_image_id: params[:design_image_id], genre: 'image_tag2').map &:image_library_category_id
  end

  def create
    flash[:design_errors] = []
    flag = true
    @design = current_user.designs.build(params[:design])
    @design.story_id = params[:story_id] if params[:story_id].present?
    unless params[:design][:title].present?
      flash[:design_errors] << "作品名称不能为空！"
      flag = false
    end
    unless params[:design][:property_name].present?
      flash[:design_errors] << "楼盘名称不能为空！"
      flag = false
    end
    unless params[:design][:area_id].present?
      flash[:design_errors] << "作品所属城市不能为空！"
      flag = false
    end

    unless params[:apartment].present?
      flash[:design_errors] << "请选择户型！"
      flag = false
    end

    unless params[:style].present?
      flash[:design_errors] << "请选择风格！"
      flag = false
    end

    unless params[:use].present?
      flash[:design_errors] << "请选择用途！"
      flag = false
    end
    if flag
      tag_str = params[:apartment] + "," + params[:use]
      if params[:fee].present?
        tag_str += "," + params[:fee]
      end
      if params[:acreage].present?
        tag_str += "," + params[:acreage]
      end
      if params[:throng].present?
        tag_str += "," + params[:throng]
      end
      tag_arr = tag_str.split(',')
      tags = params[:style] + tag_arr
      if @design.save
        tags.each do |tag|
          DesignTags.create(design_id: @design.id,image_library_category_id: tag)
        end
        current_user.create_score(current_user.id, 601 , 1 , 50)
        redirect_to upload_user_design_path(current_user, @design)
      else
        @design.errors.messages.each do |key,value|
          flash[:design_errors] += value
        end
        render :action => 'new'
      end
    else
      render :action => 'new'
    end
  end

  def update
    @design = current_user.designs.find(params[:id])

    if params[:delete_image_id].present?
        delete_image_ids = params[:delete_image_id].split(',')
        delete_image_ids.each do |image_id|
          unless image_id.blank?
            design_image = DesignImage.find(image_id)
            design_image.destroy if design_image
          end
        end 
      end

    design_image_ids = []
    if (params[:design] && params[:design][:design_image_ids].present?) || params[:design_image_ids].present?
      if params[:design] && params[:design][:design_image_ids]
        design_image_ids = design_image_ids +  params[:design][:design_image_ids]
      end
      if params[:design_image_ids].present?
        design_image_ids = design_image_ids + params[:design_image_ids]
      end
      design_image_ids.each do |design_image_id|
        image = @design.design_images.find(design_image_id)
        image.title = params[:title][design_image_id] if params[:title] && params[:title][design_image_id].present?
        image.color1 = params[:color1][design_image_id] if params[:color1] && params[:color1][design_image_id].present?
        image.is_cover = true if params[:cover_image] && params[:cover_image].to_i == design_image_id.to_i
        image.area_id = @design.area_id
        if image.save
          image_tags = ImageTag.where(design_image_id: image.id, genre: 'image_tag1')
          if image_tags.present?
            image_tags.each do |image_tag|
              image_tag.destroy
            end
          end
          design_tags = DesignTags.where(design_id: @design.id)
          design_tags.each do |design_tag|
            ImageTag.create(design_image_id: image.id, image_library_category_id: design_tag.image_library_category_id, genre: 'image_tag3')
          end
          tag_arr = []
          if params[:effect] && params[:effect][design_image_id].present?
            tag_arr << params[:effect][design_image_id]
          end
          if params[:room] && params[:room][design_image_id].present?
            tag_arr << params[:room][design_image_id]
          end
          if params[:color] && params[:color][design_image_id].present?
            tag_arr << params[:color][design_image_id]
          end
          if params[:tonality] && params[:tonality][design_image_id].present?
            tag_arr << params[:tonality][design_image_id]
          end
          if tag_arr.present?
            tag_arr.each do |tag|
              ImageTag.create(design_image_id: image.id, image_library_category_id: tag, genre: 'image_tag1')
            end
          end
        end
      end
      if @design.is_yda?
        render :js => "colors();"
      end
    else
      render :action => 'edit'
    end
  end

  def update_design
    flash[:design_errors] = []
    flag = true
    @design = current_user.designs.find(params[:id])
    unless params[:design][:title].present?
      flash[:design_errors] << "作品名称不能为空！"
      flag = false
    end
    unless params[:design][:property_name].present?
      flash[:design_errors] << "楼盘名称不能为空！"
      flag = false
    end
    unless params[:design][:area_id].present?
      flash[:design_errors] << "作品所属城市不能为空！"
      flag = false
    end

    unless params[:apartment].present?
      flash[:design_errors] << "请选择户型！"
      flag = false
    end

    unless params[:style].present?
      flash[:design_errors] << "请选择风格！"
      flag = false
    end

    unless params[:use].present?
      flash[:design_errors] << "请选择用途！"
      flag = false
    end
    @design_tags = DesignTags.where(design_id: params[:id]).map &:image_library_category_id
    if flag
      tag_str = params[:apartment] + "," + params[:use]
      if params[:fee].present?
        tag_str += "," + params[:fee]
      end
      if params[:acreage].present?
        tag_str += "," + params[:acreage]
      end
      if params[:throng].present?
        tag_str += "," + params[:throng]
      end
      design_tags = DesignTags.where(design_id: params[:id])
      tag_arr = tag_str.split(',')
      tags = params[:style] + tag_arr
      if @design.update_attributes(params[:design])
        design_tags = DesignTags.where(design_id: params[:id])
        design_tags.each do |tag|
          tag.destroy
        end
        tags.each do |tag|
          DesignTags.create(design_id: @design.id,image_library_category_id: tag)
        end
        current_user.create_score(current_user.id, 601 , 1 , 50)
        redirect_to upload_user_design_path(current_user, @design)
      else
        @design.errors.messages.each do |key,value|
          flash[:design_errors] += value
        end
        render :action => 'edit_design'
      end
    else
      render :action => 'edit_design'
    end
  end

  def upload_success
    @design = Design.find params[:design_id]
    if current_user.role_id == 1 && current_user.des_status == true
      render "upload_success2"
    elsif (current_user.role_id == 1 && current_user.des_status == false) || current_user.role_id == 2 
      render "upload_success3"
    end
  end

  def update_design_active
    @design = Design.find params[:design_id]
    @design.future_star_active = true if params[:future_star_active]
    @design.speech = params[:design][:speech] if params[:design][:speech]
    @design.property_name = params[:property_name] if params[:property_name].present?
    if params[:baicheng_active]
      @design.baicheng_active = true
    else
      @design.baicheng_active = false
    end
    @design.save
    #if params[:baicheng_active]
    #    redirect_to "/baicheng/design_works/#{params[:design_id]}"
    #else
    redirect_to user_path(current_user)
    #end
  end

  def destroy
    flash[:design] = params[:id]
    current_user.designs.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def design_update
    if current_user.present?
      @design = current_user.designs.find(params[:id])
      if params[:design] && @design.update_attributes(params[:design])
        redirect_to :action => 'index' and return
      end
      render :template => "users/design_update"
    else
      redirect_to '/'
    end
  end

  def autocomplete_recommend_color
    colors = ColorCode.select(:code).where("code LIKE ?", "%#{params[:q]}%").all.map {
        |e| e.code }
    render :text => colors.join("\n")
  end

  def autocomplete
      params[:num] = params[:num].gsub(/\W/, '') if params[:num].present?
      colors = ColorCode.where("code LIKE '%#{params[:num]}%'")
      render json: colors.map { |c| c.code }
  end

  private
  def find_design
    if current_user.present?
      @design = current_user.designs.find(params[:id])
    else
      redirect_to '/'
    end
  end
end