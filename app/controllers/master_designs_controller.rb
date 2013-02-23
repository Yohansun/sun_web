# -*- encoding : utf-8 -*-
class MasterDesignsController < ApplicationController
  before_filter :get_master_designs

  def show
    @master_design = MasterDesign.find(params[:id]) || MasterDesign.new
  end

  def get_master_designs
    @master_designs = Subject.content("master_designs").page(params[:page]).per(5)
    @master_designs = @master_designs.tagged_with(params[:tags]) if params[:tags] && params[:tags] != '全部'
    @master_designs = @master_designs.joins(:master_profile).where('master_profiles.master_kind' => params[:master_kind]) unless params[:master_kind].blank?
  end

  def fullscreen
    @master_design = MasterDesign.find(params[:id])
    @master_design_next = MasterDesign.where("published_at > ?", @master_design.published_at).last
    render :layout => nil
  end
  def download
    target_file = MasterDesign.find(params[:id])
      if target_file
        send_file target_file.main_preview_img.path
      else
        render nothing: true, status: 404
      end
  end
end
