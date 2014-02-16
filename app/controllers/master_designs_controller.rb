# -*- encoding : utf-8 -*-
require 'zip'
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
      @master_designs = @master_designs.tagged_with(tag).joins(:master_profile)
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
      zipfile_name = "#{Rails.root}/public/system/zip/master_design#{params[:id]}.zip"
      if File.exists?(zipfile_name)
        send_file zipfile_name
      else
        Zip::ZipFile.open(zipfile_name, Zip::ZipFile::CREATE) do |zipfile|
          target_file.master_design_uploads.each do |filename|
            zipfile.add(filename.file_file_name, filename.file.path) if File.exists?(filename.file.path)
          end
        end
        send_file zipfile_name
      end
    else
      render nothing: true, status: 404
    end

    # if target_file.master_design_uploads
    #   target_file.master_design_uploads.each do |t|
    #     system("zip public/master_design#{params[:id]}.zip -j #{t.file.path} ")
    #   end
    #   send_file "public/master_design#{params[:id]}.zip"
    # else
    #   render nothing: true, status: 404
    # end
  end

  private
  def get_master_designs
    @master_designs = Subject.content("master_designs").page(params[:page]).per(5)
  end

end
