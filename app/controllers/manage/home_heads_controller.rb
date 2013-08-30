# encoding: utf-8
class Manage::HomeHeadsController < Manage::BaseController
  before_filter :get_data, except: [:update, :create]

  def edit
    @order_id = params[:order_id].to_i
  end

  def insert_news
    
  end

  def save_insert
    HomeHead.order("order_id asc").each do |image|
      image.order_id += 1
      image.save
    end
    @image = HomeHead.order("order_id asc").last
    @image.title = params[:title]
    @image.link = params[:link]
    @image.order_id = 1
    redirect_to home_heads_path if @image.save
  end

  def update
    @image = HomeHead.find params[:id]
    @image.title = params[:title] if params[:title]
    @image.link = params[:link] if params[:link]
    unless @image.order_id == params[:order_id].to_i
      @anthor_image = HomeHead.find_by_order_id params[:order_id]
      @anthor_image.update_attributes(order_id: @image.order_id)
      @image.order_id = params[:order_id].to_i
    end
    redirect_to home_heads_path if @image.save
  end

  def create
    @upload = HomeHead.find_by_order_id(params[:order_id].to_i)
    upload_id = @upload.id
    @upload.file = params[:Filedata]
    if @upload.save
      flash[:notice] = "Successfully created upload."
      session[:image_id] = @upload.id
      respond_to do |format|
        format.json {render :json => { :result => 'success',
          :upload => show_type_home_heads_path(id: upload_id),
          :path =>  @upload.file.url} }
      end
    end
  end
  
  def show
    
  end

  def show_type
    @upload = HomeHead.find(params[:id].to_i)
  end

  def get_data
    @order_ids = HomeHead.order("order_id asc").map &:order_id
    @banners = HomeHead.order("order_id asc")
  end
end
