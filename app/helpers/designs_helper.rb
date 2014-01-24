# -*- encoding : utf-8 -*-
module DesignsHelper
  def design_room_type_option
    ['户型','一居室','两居室','三居室','四居室','复式','跃层','别墅','其他']
  end

  def design_style_option
    #['风格','美式','欧式','中式','日式','地中海','田园','东南亚','现代简约','后现代','新古典','混搭','其他']
    ['欧美流行系','现代简约派','清新田园风','混搭新风潮','东方新古典','其他']
  end

  def design_order_option
    ['排序','最新','最热','未来之星','因爱之名']
  end

  def design_search_link
    search_params = {:promit => 1}
    search_params.merge!({:style => params[:style]}) if params[:style].present?
    search_params.merge!({:design_color => params[:design_color]}) if params[:design_color].present?
    search_params.merge!({:order => params[:order]}) if params[:order].present? && !params[:order] == '因爱之名'
    search_params.merge!({:area_head => params[:area_head]}) if params[:area_head].present?
    search_params.merge!({:area_id => params[:area_id]}) if params[:area_id].present?
    designs_path(search_params)
  end
end
