# -*- encoding : utf-8 -*-
module ColorDesignsHelper
  def color_design_color_option
    ['浅白色系','红色系','橙色系','黄色系','绿色系','蓝色系','紫色系','中性色系']
  end
  def color_design_usage_option
    ['客厅','卧室','餐厅','厨房','卫生间','书房','儿童房','阳台','门厅','储物间','其他']
  end

  def color_design_style_option
    ['欧美流行系','现代简约派','清新田园风','混搭新风潮','东方新古典','其他']
  end

  def color_design_order_option
    ['最新','最热']
  end

  def color_design_search_link
    search_params = {:promit => 1}
    search_params.merge!({:style => params[:style]}) if params[:style].present?
    search_params.merge!({:design_color => params[:design_color]}) if params[:design_color].present?
    search_params.merge!({:design_usage => params[:design_usage]}) if params[:design_usage].present?
    search_params.merge!({:order => params[:order]}) if params[:order].present?
    color_designs_path(search_params)
  end
end