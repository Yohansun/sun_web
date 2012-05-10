# -*- encoding : utf-8 -*-
class DesignsController < ApplicationController
  before_filter :find_user
  before_filter :find_design, :only => [:upload, :edit]

  def index
    if @user
      @designs = @user.designs.order("created_at desc").page(params[:page]).joins(:design_images).group("imageable_id")
      render :template => "users/designs"
    else
      @designs = Design.page(params[:page]).per(9).joins(:design_images).group("imageable_id")
    end

    unless @designs.nil?
      if params[:order] == "最热"
        @designs = @designs.order("votes_count desc")
      else
        @designs = @designs.order("created_at desc")
      end
      style = "%#{params[:style]}%"
      design_color = "%#{params[:design_color]}%"
      @designs = @designs.where("style like ?", style) if params[:style] && !params[:style].blank? && params[:style] !='风格'
      @designs = @designs.where("design_color like ?", design_color) if params[:design_color] && !params[:design_color].blank? && params[:design_color] !='色系'
      @designs = @designs.where(:room_type => params[:room_type]) if params[:room_type] && !params[:room_type].blank? && params[:room_type] !='户型'
      @designs = @designs.where(:area_id => params[:area_id]) if params[:area_id] && !params[:area_id].blank?
    end
  end

  def fullscreen
    @design = @user.designs.find(params[:id])
    @design_next = Design.where("id > ?", params[:id]).first
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
      current_user.create_score(current_user.id, 601 , 1 , 50)
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

  def autocomplete_recommend_color
    colors = ColorCode.select(:code).where("code LIKE ?", "%#{params[:q]}%").all.map {
        |e| e.code }
    render :text => colors.join("\n")
  end

  private
  def find_design
    @design = current_user.designs.find(params[:id])
  end
end