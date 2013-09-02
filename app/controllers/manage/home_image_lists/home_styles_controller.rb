# encoding: utf-8
class Manage::HomeImageLists::HomeStylesController < Manage::BaseController
  before_filter :get_data, except: [:update, :create, :update_category]

  def edit
    @order_id = params[:order_id].to_i
  end

  def update
    @image = HomeStyle.find params[:id]
    @image.title = params[:title] if params[:title]
    @image.link = params[:link] if params[:link]
    unless @image.order_id == params[:order_id].to_i
      @anthor_image = HomeStyle.find_by_order_id params[:order_id]
      @anthor_image.update_attributes(order_id: @image.order_id)
      @image.order_id = params[:order_id].to_i
    end
    redirect_to home_styles_path if @image.save
  end
  
  def update_category
    tags = params[:tags].map{|tag| tag.to_i}
    type_tags = HomeTypeCategory.types.map &:tag
    if type_tags.size >= tags.size
      type_tags.each do |type_tag|
        unless tags.include?(type_tag.to_i)
           HomeTypeCategory.find_by_tag(type_tag).destroy
        end
      end
      type_tags = HomeTypeCategory.types.map &:tag
    end
    if tags.size > type_tags.size
      tags.each do |tag|
        unless type_tags.include?(tag.to_i)
          HomeTypeCategory.create(:tag => tag.to_i, :tagable_type => "home_style")
        end
      end
    end
    redirect_to home_styles_path
  end

  def insert_news
  end

  def save_insert
    HomeStyle.order("order_id asc").each do |image|
      image.order_id += 1
      image.save
    end
    @image = HomeStyle.order("order_id asc").last
    @image.title = params[:title]
    @image.link = params[:link]
    @image.order_id = 1
    redirect_to home_styles_path if @image.save
  end

  def create
    @upload = HomeStyle.find_by_order_id(params[:order_id].to_i)
    upload_id = @upload.id
    @upload.file = params[:Filedata]
    if @upload.save
      flash[:notice] = "Successfully created upload."
      session[:image_id] = @upload.id
      respond_to do |format|
        format.json {render :json => { :result => 'success',
          :upload => show_type_home_styles_path(id: upload_id),
          :path =>  @upload.file.url} }
      end
    end
  end
  
  def show
    
  end

  def show_type
    @upload = HomeStyle.find(params[:id].to_i)
  end

  def get_data
    @order_ids = HomeStyle.order("order_id asc").map &:order_id
    @lists = HomeImageList.all
    @categories = ImageLibraryCategory.where(parent_id: 34)
    @banners = HomeStyle.order("order_id asc")
    @home_categories = HomeTypeCategory.where("home_type_categories.tagable_type = ?", "home_style").map &:tag
  end
end
