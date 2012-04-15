# -*- encoding : utf-8 -*-
class DesignsController < ApplicationController
  before_filter :find_user
  before_filter :find_design, :only => [:upload, :edit]

  def index
    if @user
      @designs = @user.designs.page params[:page]
      render :template => "users/designs"
    else
      @designs = Design.page(params[:page]).per(9)
    end

    unless @designs.nil?
      if params[:order] == "最热"
        @designs = @designs.order("votes_count desc")
      else
        @designs = @designs.order("created_at desc")
      end

      @designs = @designs.where(:style => params[:style]) if params[:style] && !params[:style].blank? && params[:style] !='风格'
      @designs = @designs.where(:room_type => params[:room_type]) if params[:room_type] && !params[:room_type].blank? && params[:room_type] !='户型'
      @designs = @designs.where(:area_id => params[:area_id]) if params[:area_id] && !params[:area_id].blank?
    end
  end

  def fullscreen
    @design = @user.designs.find(params[:id])
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
      redirect_to action: 'index'
    else
      render :action => 'edit'
    end
  end

  def destroy
    flash[:design] = params[:id]
    current_user.designs.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def design_update
    @design = current_user.designs.find(params[:id])
    if params[:design] && @design.update_attributes(params[:design])
      redirect_to :action => 'index' and return
    end
    render :template => "users/design_update"
  end

  private
  def find_design
    @design = current_user.designs.find(params[:id])
  end
end