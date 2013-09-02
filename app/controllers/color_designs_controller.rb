# -*- encoding : utf-8 -*-
class ColorDesignsController < ApplicationController
  before_filter :get_color_designs

  def index
    unless @designs.nil?
      if params[:order] == "最热"
        @designs = @designs.order("votes_count desc")
      else
        @designs = @designs.order("created_at desc")
      end

      @designs = @designs.where(:design_color => params[:design_color]) if params[:design_color] && !params[:design_color].blank? && params[:design_color] !='色系'
      @designs = @designs.where(:design_style => params[:design_style]) if params[:design_style] && !params[:design_style].blank? && params[:design_style] !='风格'
      @designs = @designs.where(:design_usage => params[:design_usage]) if params[:design_usage] && !params[:design_usage].blank? && params[:design_usage] !='功能区'

    end

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

    expires_in 60.minutes, 'max-stale' => 2.hours, :public => true
  end

  def get_color_designs
    designs = Subject.content("color_designs")
    @tags = designs.tag_counts_on(:tags) || [Tag.new]
    @designs = designs.page(params[:page]).per(9)
    @designs = @designs.tagged_with(params[:tags]) if params[:tags]
  end

  def fullscreen
    @design = ColorDesign.find(params[:id])
    @design_next = ColorDesign.where("id > ?", params[:id]).first
    render :layout => nil
  end

  def download
    target_file = ColorDesign.find(params[:id])
      if target_file
        send_file target_file.show_preview_img.path
      else
        render nothing: true, status: 404
      end
  end

end