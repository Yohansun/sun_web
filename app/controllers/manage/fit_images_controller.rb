# encoding: utf-8
class Manage::FitImagesController < Manage::BaseController
	layout "manage"
  cache_sweeper :home_sweeper, :only => [:create, :destroy]
  def index
  	@upload = FitImage.first
  end

  def create
  	if params[:fit_image_id]
  		@fit = FitImage.find(params[:fit_image_id])
	  	@fit.title = params[:title]
	  	@fit.link = params[:link]
	  	if @fit.save
        redirect_to fit_images_path
	  	end
	  else
	  	@upload = FitImage.new
	    @upload.file = params[:Filedata]
	    if @upload.save
	      flash[:notice] = "Successfully created upload."
	      session[:image_id] = @upload.id
	      respond_to do |format|
	        format.json {render :json => { :result => 'success',
	          :upload => fit_image_path(@upload.id),
	          :path =>  @upload.file.url(:spring_img)} }
	      end
	    end
	  end
  end

  def show
    @upload = FitImage.find(params[:id])
  end

  def destroy
  	@banner = FitImage.find params[:id]
    @banner.delete
    redirect_to fit_images_path
  end

end
