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

end