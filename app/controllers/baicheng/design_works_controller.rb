# encoding: utf-8
class Baicheng::DesignWorksController < ApplicationController
	layout 'baicheng'

  def new
  end

  def show
  	@design = Design.find(params[:id])
  	@design_images = @design.design_images.available
  	@image = DesignImage.find(70431)
  	@comments = @design.comments.page(params[:page]).per(4)
  end
end
