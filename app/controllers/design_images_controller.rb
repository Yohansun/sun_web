class DesignImagesController < ApplicationController
  def create
    newparams = coerce(params)
    @upload = current_user.design_images.new(newparams[:upload])
    if @upload.save
      flash[:notice] = "Successfully created upload."
      respond_to do |format|
        format.json {render :json => { :result => 'success',
          :upload => user_design_image_path(current_user, @upload.id) } }
      end
    else
      render :action => 'new'
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