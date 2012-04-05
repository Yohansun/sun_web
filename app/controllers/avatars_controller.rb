class AvatarsController < ApplicationController
  def create
    newparams = coerce(params)
    @upload = current_user.build_avatar(newparams[:upload])
    if @upload.save
      flash[:notice] = "Successfully created upload."
      respond_to do |format|
        format.json {render :json => { :result => 'success',
          :upload => user_avatar_path(current_user) } }
      end
    else
      render :action => 'new'
    end
  end

  def show
    @upload = User.find(params[:user_id]).avatar
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