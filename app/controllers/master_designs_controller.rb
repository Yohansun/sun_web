# -*- encoding : utf-8 -*-
class MasterDesignsController < ApplicationController
  before_filter :get_master_designs

  def show
    @master_design = MasterDesign.find(params[:id]) || MasterDesign.new
    @color1 = ColorCode.find_by_code(@master_design.recommend_color1)
    @color2 = ColorCode.find_by_code(@master_design.recommend_color2)
    @color3 = ColorCode.find_by_code(@master_design.recommend_color3)
  end

  def get_master_designs
    @master_designs = Subject.content("master_designs").page(params[:page]).per(5)
    @master_designs = @master_designs.tagged_with(params[:tags]) if params[:tags] && params[:tags] != '全部'
    @master_designs = @master_designs.joins(:master_profile).where('master_profiles.master_kind' => params[:master_kind]) unless params[:master_kind].blank?
  end

  def fullscreen
    @master_design = MasterDesign.find(params[:id])
    render :layout => nil
  end
end
