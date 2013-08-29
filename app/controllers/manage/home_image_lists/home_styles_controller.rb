# encoding: utf-8
class Manage::HomeImageLists::HomeStylesController < Manage::BaseController
  before_filter :get_data, except: [:update, :create, :update_category]

  def edit
    @order_id = params[:order_id].to_i
  end

  def update
    @image = HomeStyle.find params[:id]
    @image.title = params[:title]
    @image.link = params[:link]
    # if @image.save
    #   render js: "alert('保存成功!');location.reload();"
    # end
    redirect_to home_styles_path if @image.save
  end
  
  def update_category
    tags = params[:tags]
    type_tags = HomeTypeCategory.categories.map &:tag
    tags.each do |tag|
      unless type_tags.include?(tag.to_i)
        HomeTypeCategory.create(:tag => tag.to_i, :tagable_type => "home_type")
      end
    end
    redirect_to home_styles_path
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
    @lists = HomeImageList.all
    @categories = ImageLibraryCategory.where(parent_id: 34)
    @banners = HomeStyle.order("order_id asc")
    @home_categories = HomeTypeCategory.where("home_type_categories.tagable_type = ?", "home_type").map &:tag
  end
end
