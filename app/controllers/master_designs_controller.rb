# -*- encoding : utf-8 -*-
class MasterDesignsController < ApplicationController
  before_filter :get_master_designs,:only => [:index,:all,:show,:oversea,:hk_tw_mc,:cn]
  
  def index
  end

  def show
    @master_design = MasterDesign.find(params[:id]) || MasterDesign.new
  end
  
  def all
    render "index"
  end
  
  {:oversea => "海外",:hk_tw_mc => "港澳台",:cn => "中国大陆"}.each do |act,tag|
    define_method(act) do
      hash = {"shinei" => "室内空间大师","color" => "色彩大师"}
      condition = hash.keys.include?(type = params[:type]) ? {:master_profile => {:master_kind => hash[type]}} : nil
      @articles = @master_designs.tagged_with(tag).joins(:master_profile).where(condition)
      render "index"
    end
  end

  def fullscreen
    @master_design = MasterDesign.find(params[:id])
    @master_design_next = MasterDesign.where("published_at > ?", @master_design.published_at).last
    render :layout => nil
  end
  
  def download
    target_file = MasterDesign.find(params[:id])
    if target_file.master_design_uploads
      target_file.master_design_uploads.each do |t|
        system("zip public/master_design#{params[:id]}.zip -j #{t.file.path} ")
      end
      send_file "public/master_design#{params[:id]}.zip"
    else
      render nothing: true, status: 404
    end
  end
  
  private
  def get_master_designs
    @master_designs = Subject.content("master_designs").page(params[:page]).per(5)
  end
  
end
