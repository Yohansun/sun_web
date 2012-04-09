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

      @designs = @designs.where(:design_color => params[:design_color]) if params[:design_color] && params[:design_color] !='所有'
      @designs = @designs.where(:design_style => params[:design_style]) if params[:design_style] && params[:design_style] !='所有'
      @designs = @designs.where(:design_usage => params[:design_usage]) if params[:design_usage] && params[:design_usage] !='所有'

    end
  end
  
  def show
    @design = ColorDesign.find(params[:id])
    @tags = ColorDesign.tag_counts_on(:tags)
    @comments = @design.comments.page params[:page]
  end

  def get_color_designs
    designs = Subject.content("color_designs")
    @tags = designs.tag_counts_on(:tags) || [Tag.new]
    @designs = designs.page(params[:page]).per(9)
    @designs = @designs.tagged_with(params[:tags]) if params[:tags]
  end

  def fullscreen
    @design = ColorDesign.find(params[:id])
    render :layout => nil
  end

end
