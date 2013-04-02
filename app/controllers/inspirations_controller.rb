# -*- encoding : utf-8 -*-
class InspirationsController < ApplicationController
  before_filter :find_user
  before_filter :find_inspiration, :only => [:upload, :edit]
  before_filter :judge_inspiration,:only => [:index,:inspirations_hot,:inspirations_new,:inspirations_minisite]

  def index
    @inspirations = @inspirations.order("created_at desc") unless @inspirations.nil?
  end
  
  {:inspirations_hot => "votes_count",:inspirations_new => "created_at",:inspirations_minisite => "created_at"}.each do |act,order_name|
    define_method(act) do
      @inspirations = @inspirations.order("#{order_name} desc")
      @inspirations = Inspiration.where(is_minisite: true).order("#{order_name} desc").page(params[:page]) if act == :inspirations_minisite
      
      render "index"
    end
  end

  def download
    target_file = Inspiration.find(params[:id])
    if target_file
      send_file target_file.design_images.first.file.path
    else
      render nothing: true, status: 404
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
  
  def judge_inspiration
    if @user
      @inspirations = @user.inspirations.joins(:design_images).group("inspirations.id").where("design_images.imageable_id = inspirations.id").page params[:page]

      load_skin
    else
      @inspirations = Inspiration.joins(:design_images).group("inspirations.id").where("design_images.imageable_id = inspirations.id").page params[:page]
    end
  end
end
