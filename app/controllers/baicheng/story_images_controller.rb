class Baicheng::StoryImagesController < ApplicationController
  def create
    if current_user
      @upload = StoryImage.new
      @upload.file = params[:Filedata]
      @upload.user_id = 1 #current_user.id
      if @upload.save
        flash[:notice] = "Successfully created upload."
        session[:image_id] = @upload.id
        respond_to do |format|
          format.json {render :json => { :result => 'success',
            :upload => story_image_path(@upload.id),
            :path =>  @upload.file.url(:spring_img)} }
        end
      end
    end
  end

  def show
    @upload = StoryImage.find(params[:id])
  end
end