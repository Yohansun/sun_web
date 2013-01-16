# -*- encoding : utf-8 -*-
class DesignImagesController < ApplicationController
  def create
    newparams = coerce(params)
    @upload = DesignImage.new(newparams[:upload])
    if @upload.save
      flash[:notice] = "Successfully created upload."
      session[:image_id] = @upload.id
      respond_to do |format|
        format.json {render :json => { :result => 'success',
          :upload => design_image_path(@upload.id) } }
      end
    else
      respond_to do |format|
        format.json {render :json => { :result => 'failed',
          :action => 'new' } }
      end
    end
  end

  def show
    @upload = DesignImage.find(params[:id])
  end

  def update
    @image = DesignImage.find(params[:id])
    image_params = params[:design_image]
    @image.title = image_params[:title] if image_params[:title].present?
    3.times.each do |item|
      next if image_params["color#{item}".to_sym].blank?
      if ColorCode.find_by_code(image_params["color#{item}".to_sym])
        @image.send("color#{item}=", image_params["color#{item}".to_sym])
      end
    end
    @image.save
    redirect_to image_libraries_path
  end

  def autocomplete
    params[:num] = params[:num].gsub(/\W/, '') if params[:num].present?
    colors = ColorCode.where("code LIKE '%#{params[:num]}%'")
    render json: colors.map { |c| c.code }
  end

  private
  def coerce(params)
    if params[:upload].nil?
      h = Hash.new
      h[:upload] = Hash.new
      h[:upload][:file] = params[:Filedata]
      h[:upload][:file].content_type = MIME::Types.type_for(h[:upload][:file].original_filename).to_s
      h
    else
      params
    end
  end
end