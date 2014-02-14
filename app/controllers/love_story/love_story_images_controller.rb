# encoding: utf-8
class LoveStory::LoveStoryImagesController < LoveStory::BaseController
  def create
    if current_user
      stroy_image = LoveStoryImage.new
      stroy_image.file = params[:Filedata]
      stroy_image.user_id = current_user.id
      if stroy_image.save
        session[:image_id] = stroy_image.id
        respond_to do |format|
          format.json {render :json => { :result => 'success',
            :upload => love_story_image_path(stroy_image.id),
            :path =>  stroy_image.file.url(:small)} }
        end
      end
    end
  end

  def show
    @upload = LoveStoryImage.find(params[:id])
  end

  def del_image
    image = LoveStoryImage.find(params[:id])
    if image.destroy
      respond_to do |format|
        format.json {render :json => { :result => 'ok'} }
      end
    else
      respond_to do |format|
        format.json {render :json => { :result => 'no'} }
      end
    end
  end
end
