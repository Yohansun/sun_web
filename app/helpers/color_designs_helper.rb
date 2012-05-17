# -*- encoding : utf-8 -*-
module ColorDesignsHelper
  def color_design_color_option
    [['色系',{:class => 'nobg'}],['浅白色系',{:class => 'color_white'}],['红色系',{:class => 'color_red'}],['橙色系',{:class => 'color_org'}],
     ['黄色系',{:class => 'color_org1'}],['绿色系',{:class => 'color_gr'}],['蓝色系',{:class => 'color_blue'}],
     ['紫色系',{:class => 'color_zs'}],['中性色系',{:class => 'color_mid'}]]
  end
  def color_design_usage_option
    ['功能区','客厅','卧室','餐厅','厨房','卫生间','书房','儿童房','阳台','门厅','储物间','其他']
  end

  def color_design_style_option
    #['风格','美式','欧式','中式','日式','地中海','田园','东南亚','现代简约','后现代','新古典','混搭','其他']
    ['风格','欧美流行系','现代简约派','清新田园风','混搭新风潮','东方新古典','其他']
  end

  def color_design_order_option
    ['排序','最新','最热']
  end
end