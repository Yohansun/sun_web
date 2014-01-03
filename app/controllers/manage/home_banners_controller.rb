# encoding: utf-8
class Manage::HomeBannersController < Manage::BaseController
  layout "manage"
  skip_before_filter :verify_authenticity_token, :only => [:create, :index]
  def index
    @banners = HomeBanner.order("id desc")
    @banner_name = ["业主通道banner 290x200","精华推荐banner 270x100","底部大banner 670x85","底部小banner 310x85","大师殿堂banner 1000x85"]
  end

  def create
    unless params[:Filedata]
      params[:banner_name].each do |key, value|
        @banner = HomeBanner.find(key)
        @banner.banner_name = value
        @banner.link = params[:link][key.to_sym]
        @banner.save
      end
      redirect_to "/manage/home_banners"
    else
      @upload = HomeBanner.new
      @upload.file = params[:Filedata]
      if @upload.save
        flash[:notice] = "Successfully created upload."
        session[:image_id] = @upload.id
        respond_to do |format|
          format.json {render :json => { :result => 'success',
            :upload => home_banner_path(@upload.id),
            :path =>  @upload.file.url(:spring_img)} }
        end
      end
    end
  end

  def show
    @upload = HomeBanner.find(params[:id])
  end

  def destroy
    @banner = HomeBanner.find params[:id]
    @banner.delete
    redirect_to home_banners_path
  end

  def update

  end

end
