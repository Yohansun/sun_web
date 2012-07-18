# -*- encoding : utf-8 -*-
class InspirationsController < ApplicationController
  before_filter :find_user
  before_filter :find_inspiration, :only => [:upload, :edit]

  def index
    if @user
      @inspirations = @user.inspirations.joins(:design_images).group("inspirations.id").where("design_images.imageable_id = inspirations.id").page params[:page]

      load_skin
    else
      @inspirations = Inspiration.joins(:design_images).group("inspirations.id").where("design_images.imageable_id = inspirations.id").page params[:page]
    end

    unless @inspirations.nil?
      if params[:order] == "最热"
        @inspirations = @inspirations.order("votes_count desc")
      else
        @inspirations = @inspirations.order("created_at desc")
      end
    end
  end

  def fullscreen
    @inspiration = @user.inspirations.find(params[:id])
    @inspiration_next = Inspiration.where("id > ?", params[:id]).first
    render :layout => nil
  end

  def show
    @inspiration = Inspiration.find(params[:id])
    @comments    = @inspiration.comments.page params[:page]
  end

  def new
    @inspiration = current_user.inspirations.new
  end

  def create
    @inspiration = current_user.inspirations.build(params[:inspiration])
    if @inspiration.save
      current_user.create_score(current_user.id, 602 , 1 , 30)
      redirect_to upload_user_inspiration_path(current_user, @inspiration)
    else
      render :action => 'new'
    end
  end

  def update
    @inspiration = current_user.inspirations.find(params[:id])
    if @inspiration.update_attributes(params[:inspiration])
      if params[:cover_image]
        image          = @inspiration.design_images.find(params[:cover_image])
        image.is_cover = true
        image.save
      end
      redirect_to :action => "show"
    else
      render :action => 'edit'
    end
  end

  def destroy
    flash[:inspiration] = params[:id]
    current_user.inspirations.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def inspiration_update
    @inspiration = current_user.inspirations.find(params[:id])
    if params[:inspiration] && @inspiration.update_attributes(params[:inspiration])
      redirect_to :action => 'index' and return
    end
    render :template => "users/inspiration_update"
  end

  private
  def find_inspiration
    @inspiration = current_user.inspirations.find(params[:id])
  end
end
