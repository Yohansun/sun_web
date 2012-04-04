class DesignsController < ApplicationController
  before_filter :find_user
  before_filter :find_design, :only => [:upload, :edit]

  def index
    if @user
      @designs = @user.designs.page params[:page]
      render :template => "users/designs"
    else
      @designs = Design.page params[:page]
    end
  end

  def fullscreen
    render :layout => nil
  end

  def show
    @design = Design.find(params[:id])
    @comments = @design.comments.page params[:page]
  end

  def new
    @design = current_user.designs.new
  end

  def create
    @design = current_user.designs.build(params[:design])
    if @design.save
      redirect_to upload_user_design_path(current_user, @design)
    else
      render :action => 'new'
    end
  end

  def update
    @design = current_user.designs.find(params[:id])
    if @design.update_attributes(params[:design])
      if params[:cover_image]
        image = @design.design_images.find(params[:cover_image])
        image.is_cover = true
        image.save
      end
      redirect_to :action => "show"
    else
      render :action => 'edit'
    end
  end

  private
  def find_design
    @design = current_user.designs.find(params[:id])
  end
end