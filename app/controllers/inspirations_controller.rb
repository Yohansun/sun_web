class InspirationsController < ApplicationController
  before_filter :find_user
  before_filter :find_inspiration, :only => [:upload, :edit]

  def index
  	if @user
      @inspirations = @user.inspirations.page params[:page]
    	render :template => "users/inspirations"
    else
      @inspirations = Inspiration.page params[:page]
    end
  end

  def fullscreen
    @inspiration = @user.inspirations.find(params[:id])
    render :layout => nil
  end

  def show
  	@inspiration = Inspiration.find(params[:id])
    @comments = @inspiration.comments.page params[:page]
  end

  def new
  	@inspiration = current_user.inspirations.new
  end

  def create
  	@inspiration = current_user.inspirations.build(params[:inspiration])
  	if @inspiration.save
  		redirect_to upload_user_inspiration_path(current_user, @inspiration)
  	else
  		render :action => 'new'
  	end
  end

  def update
    @inspiration = current_user.inspirations.find(params[:id])
    if @inspiration.update_attributes(params[:inspiration])
      if params[:cover_image]
        image = @inspiration.design_images.find(params[:cover_image])
        image.is_cover = true
        image.save
      end
      redirect_to :action => "show"
    else
      render :action => 'edit'
    end
  end

  private
  def find_inspiration
    @inspiration = current_user.inspirations.find(params[:id])
  end
end
