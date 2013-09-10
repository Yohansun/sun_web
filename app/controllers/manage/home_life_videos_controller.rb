#encoding: utf-8
class Manage::HomeLifeVideosController < Manage::BaseController
  def index
  	@home_life_videos = HomeLifeVideo.all
  end

  def edit
    @id = params[:id]
    @home_life_video = HomeLifeVideo.find_by_id(@id)

    render :partial => "edit"
  end

  def update
  	@id = params[:id]
    rank = params[:rank]
    title = params[:title]
    url = params[:url]
    @home_life_video = HomeLifeVideo.find_by_id(@id)
    result = "上传失败"
    if @home_life_video
  		@home_life_video.file = params[:files] if params[:files].present?
      @home_life_video.title = title
      @home_life_video.rank = rank
  		@home_life_video.url = url
    	if @home_life_video.save
    		result = "上传成功"
  		end

      if @home_life_video.id == 1
        @home_life_video_other = HomeLifeVideo.find(2)
      else
        @home_life_video_other = HomeLifeVideo.find(1)
      end
      @home_life_video_other.rank = "#{rank}" == "1" ? 2 : 1
      @home_life_video_other.save

    end

    if params[:files].present?
      redirect_to "/manage/home_life_videos"
    else
      render :json => {:notify => result}, :layout => false
    end
  end

end
