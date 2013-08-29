# encoding: utf-8
class Manage::HomeImageLists::HomeColorsController < Manage::BaseController
  before_filter :get_data, except: [:update, :create, :update_category]

  def edit
    @order_id = params[:order_id].to_i
  end

  def update
    @image = HomeColor.find params[:id]
    @image.title = params[:title]
    @image.link = params[:link]
    # if @image.save
    #   flash[:notice] = "Congratulations, you're signed up!"
    #   redirect_to home_colors_path
    # end
    redirect_to home_colors_path if @image.save
  end
  
  def update_category
    tags = params[:tags]
    type_tags = HomeTypeCategory.categories.map &:tag
    tags.each do |tag|
      unless type_tags.include?(tag.to_i)
        HomeTypeCategory.create(:tag => tag.to_i, :tagable_type => "home_type")
      end
    end
    redirect_to home_colors_path
  end

  def create
    @upload = HomeColor.find_by_order_id(params[:order_id].to_i)
    upload_id = @upload.id
    @upload.file = params[:Filedata]
    if @upload.save
      flash[:notice] = "Successfully created upload."
      session[:image_id] = @upload.id
      respond_to do |format|
        format.json {render :json => { :result => 'success',
          :upload => show_type_home_colors_path(id: upload_id),
          :path =>  @upload.file.url} }
      end
    end
  end
  
  def show
    
  end

  def show_type
    @upload = HomeColor.find(params[:id].to_i)
  end

  def get_data
    @lists = HomeImageList.all
    @categories = ImageLibraryCategory.where(parent_id: 107)
    @banners = HomeColor.order("order_id asc")
    @home_categories = HomeTypeCategory.where("home_type_categories.tagable_type = ?", "home_color").map &:tag
  end
end
