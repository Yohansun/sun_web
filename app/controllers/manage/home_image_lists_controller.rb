# encoding: utf-8
class Manage::HomeImageListsController < Manage::BaseController
  def index
    @lists = HomeImageList.all
  end
  
  def search_type
  	case params[:design_type]
    when "home_color"
    	redirect_to home_colors_path
    when "home_type"
    	redirect_to home_types_path
    when "home_style"
    	redirect_to home_styles_path
    when "home_cost"
      redirect_to home_costs_path
    when "home_space"
      redirect_to home_spaces_path
  	end
  end

  # def search_type
  # 	@categories = ImageLibraryCategory.where(parent_id: 1)
  # 	@banners = HomeType.order("order_id asc")
  # 	render :search_type
  # end
  
  def edit_home_image_list
  	@image = HomeType.find params[:id]
  	render :edit_home_image_list
  end

  def save_home_image_list
    
  end
end