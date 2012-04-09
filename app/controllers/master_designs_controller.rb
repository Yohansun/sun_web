class MasterDesignsController < ApplicationController
  before_filter :get_master_designs

  def show
    @master_design = MasterDesign.find(params[:id])
  end

  def get_master_designs
    master_designs = Subject.content("master_designs")
    @master_designs = master_designs.page(params[:page]).per(5)
    @master_designs = @master_designs.tagged_with(params[:tags]) if params[:tags]
    master_designs
  end

  def fullscreen
    render :layout => nil
  end
end
