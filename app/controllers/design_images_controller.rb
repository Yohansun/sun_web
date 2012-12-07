class DesignImagesController < ApplicationController
  def create
    newparams = coerce(params)
    @upload = DesignImage.new(newparams[:upload])
    if @upload.save
      flash[:notice] = "Successfully created upload."
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