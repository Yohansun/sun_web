# encoding: utf-8
require 'zip/zip'
class DesignsController < ApplicationController
  layout "home_manage"
  before_filter :find_user
  before_filter :find_design, :only => [:upload, :edit]

  def download
    target_file = DesignImage.where(:imageable_id => params[:id])
    zipfile_name = "#{Rails.root}/public/system/zip/design#{params[:id]}.zip"
    if File.exists?(zipfile_name)
      system("rm public/system/zip/design#{params[:id]}.zip")
    end
    Zip::ZipFile.open(zipfile_name, Zip::ZipFile::CREATE) do |zipfile|
      target_file.each_with_index do |filename,index|
        zipfile.add("#{filename.id}.jpg", filename.file.path(:slide)) if File.exists?(filename.file.path(:slide))
      end
    end
    send_file zipfile_name
  end

  def story_talking
    if params[:id].present?
      design = Design.find(params[:id])
      #点击洽谈用户的id
      design.story_talking_id = current_user.id
      if design.save
        render :js => "alert('按照屏幕显示的联系方式与设计师进行深入洽谈，会获得更符合期望的设计！洽谈成功后上传合同，更有机会获得爱琴海双人浪漫游！');"
      else
        render nothing: true
      end
    else
      render nothing: true
    end
  end

  def index
    if @user
      @designs = @user.designs.order("designs.id desc").page(params[:page]).per(9)
      load_skin
    else
      @designs = Design.includes(:user).joins(:design_images).where("users.id is not null").group("designs.id").order("designs.id desc")
      if params[:order] == "最热"
        @designs = @designs.order("designs.votes_count desc")
      elsif params[:order] == "未来之星"
        @designs = @designs.joins(:user).where("users.source = 'yda'").order("designs.id desc")
      elsif params[:order] == "因爱之名"
        @designs = @designs.where(baicheng_active: true).order("designs.id desc")
      elsif params[:q] == "super_refresh"
        @designs = @designs.where(is_refresh: true).order("designs.id desc")
      else
        @designs = @designs.order("designs.id desc")
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
      @designs = @designs.page(params[:page]).per(15)
    end

    @master_interviews = IColumnData.show_data(6).limit(5)
    @master_more = IColumnData.where(i_column_type_id: 6,position: 0).first
    @about_info = IColumnData.show_data(7).limit(5)
    @more_info = IColumnData.where(i_column_type_id: 7,position: 0).first

    sign_in(@user) if current_admin && @user
  end

  def fullscreen
    @design = @user.designs.find(params[:id])
    @design_next = Design.includes(:design_images).where("designs.id > ? and design_images.file_file_size > ?", params[:id], 0).first

    @design_name = @design.title
    @author = @design.user.username

    render :layout => nil
  end

  def show
    @design = Design.find(params[:id])
    @comments = @design.comments.page params[:page]
    if params[:image_id]
      @image = DesignImage.find(params[:image_id])
    end

    @master_interviews = IColumnData.show_data(6).limit(5)
    @master_more = IColumnData.where(i_column_type_id: 6,position: 0).first
    @about_info = IColumnData.show_data(7).limit(5)
    @more_info = IColumnData.where(i_column_type_id: 7,position: 0).first
  end

  def new
    if current_user.present? && !current_user.common_user?
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
    @design_image = DesignImage.find params[:design_image_id]
    @image_tags = ImageTag.where(design_image_id: params[:design_image_id], genre: 'image_tag2').map &:image_library_category_id
  end

  def create
    flash[:design_errors] = []
    flag = true
    @design = current_user.designs.build(params[:design])
    if params[:story_id].present?
      @design.story_id = params[:story_id]
      @design.baicheng_active = true
    end
    if params[:baicheng_active].present?
      @design.baicheng_active = true
    end
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
        redirect_to upload_user_design_path(current_user, @design, {:story_id => params[:story_id]})
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
        if params[:color_name] && params[:color_name][design_image_id].present?
          color1 = nil
          color2 = nil
          color3 = nil

          params[:color_name][design_image_id].each_with_index do |color_name,index|
            color1 = color_name if "color1" == "color#{index + 1}"
            color2 = color_name if "color2" == "color#{index + 1}"
            color3 = color_name if "color3" == "color#{index + 1}"
          end
          image.color1 = color1
          image.color2 = color2
          image.color3 = color3
        end
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

          if params[:delete_image_tag][design_image_id].present?
            img_tag = ImageTag.where("design_image_id = ? and image_library_category_id = ?", design_image_id, params[:delete_image_tag][design_image_id]).first
          else
            if params[:effect_id][design_image_id].present?
              img_tag = ImageTag.where("design_image_id = ? and image_library_category_id = ?", design_image_id, params[:effect_id][design_image_id]).first
            else
              img_tag = ImageTag.new
            end
          end

          if params[:effect][design_image_id].present?
            img_tag.design_image_id = design_image_id
            img_tag.image_library_category_id = params[:effect][design_image_id].to_s
            img_tag.genre = 'image_tag2'
            img_tag.save
          else
            img_tag.destroy
          end

          tag_arr = []
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
    if @design.baicheng_active
       # redirect_to design_competes_path
       redirect_to "/love/design_competes/#{params[:design_id]}"
    else
      redirect_to user_path(current_user)
    end
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
    if current_user.present? && !current_user.common_user?
      @design = current_user.designs.find(params[:id])
    else
      redirect_to '/'
    end
  end
end
