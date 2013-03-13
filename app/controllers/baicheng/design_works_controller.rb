# encoding: utf-8
class Baicheng::DesignWorksController < ApplicationController
	layout 'baicheng'

  def index
    @event_data = if params[:search_area].present?
                    BaichengEvent.search_by_area(params[:search_area]).page(params[:page]).per(28)
                  else
                    BaichengEvent.scoped.order('created_at DESC').page(params[:page]).per(28)
                  end
  end

  def opus
    @event_data = BaichengEvent.by_type(Design.name).order('created_at DESC').page(params[:page]).per(28)
  end

  def new
  end

  def show
  	@design = Design.find(params[:id])
  	@design_images = @design.design_images.available
  	@image_colors = []
  	@design_images.each do |image|
  		@image_colors << ColorCode.where("code in (?)", [image.color1, image.color2, image.color3])
  	end
  	@image = DesignImage.find(70431)
  	@comments = @design.comments.page(params[:page]).per(4)
  end
end
