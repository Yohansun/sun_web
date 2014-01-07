# -*- encoding : utf-8 -*-
class ColorDesignsController < ApplicationController
  layout "home_manage"
  before_filter :get_color_designs

  def index
    unless @designs.nil?
      if params[:order] == "最热"
        @designs = @designs.order("votes_count desc")
      else
        @designs = @designs.order("id desc")
      end

      @designs = @designs.where(:design_color => params[:design_color]) if params[:design_color].present?
      @designs = @designs.where(:design_style => params[:design_style]) if params[:design_style].present?
      @designs = @designs.where(:design_usage => params[:design_usage]) if params[:design_usage].present?

    end
    @master_interviews = IColumnData.show_data(6).limit(5)
    @master_more = IColumnData.where(i_column_type_id: 6,position: 0).first
    @about_info = IColumnData.show_data(7).limit(5)
    @more_info = IColumnData.where(i_column_type_id: 7,position: 0).first
    @banners = IBanner.page_name('色彩配搭').order("position ASC").all

    expires_in 60.minutes, 'max-stale' => 2.hours, :public => true
  end

  def show
    @design = ColorDesign.find(params[:id]) || Design.new
    @tags = ColorDesign.tag_counts_on(:tags)
    @comments = @design.comments.page params[:page]
    @code = ColorCode.find_by_code(@design.recommend_color1)

    @design_next = ColorDesign.where("id < ?", params[:id]).last if @design
    @design_next = @design_next.id if @design_next
    @design_next = @design.id if @design_next.blank?

    @design_prev = ColorDesign.where("id > ?", params[:id]).last if @design
    @design_prev = @design_prev.id if @design_prev
    @design_prev = @design.id if @design_prev.blank?

    @color1, @color2, @color3 = search_color_code(@design.recommend_color1), search_color_code(@design.recommend_color2), search_color_code(@design.recommend_color3)
    @master_interviews = IColumnData.show_data(6).limit(5)
    @master_more = IColumnData.where(i_column_type_id: 6,position: 0).first
    @about_info = IColumnData.show_data(7).limit(5)
    @more_info = IColumnData.where(i_column_type_id: 7,position: 0).first
    @banners = IBanner.page_name('设计鉴赏内页').order("position ASC").all

    expires_in 60.minutes, 'max-stale' => 2.hours, :public => true
  end

  def get_color_designs
    designs = Subject.content("color_designs")
    @tags = designs.tag_counts_on(:tags) || [Tag.new]
    @designs = designs.page(params[:page]).per(12)
    @designs = @designs.tagged_with(params[:tags]) if params[:tags]
  end

  def fullscreen
    @design = ColorDesign.find(params[:id])
    @design_next = ColorDesign.where("id > ?", params[:id]).first
    render :layout => nil
  end

  def download
    target_file = ColorDesign.find(params[:id])
    unless target_file.blank?
      zipfile_name = "#{Rails.root}/public/system/zip/color_designs#{params[:id]}.zip"
      if File.exists?(zipfile_name)
        send_file zipfile_name
      else
        Zip::ZipFile.open(zipfile_name, Zip::ZipFile::CREATE) do |zipfile|
          zipfile.add(target_file.show_preview_img_file_name, target_file.show_preview_img.path) if File.exists?(target_file.show_preview_img.path)
        end
        send_file zipfile_name
      end
    else
      redirect_to :back
    end
  end

end