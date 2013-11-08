# -*- encoding : utf-8 -*-
class RefreshRecordController < ApplicationController
  layout "home_manage"
  before_filter :get_data
  def index
    @kv = HomeKv.where(position: nil, visible: true).first
    @life_memoirs = ILifeMemoir.order("id desc").page(params[:page]).per(4)
    @wonderfuls = IColumnData.show_data(16).limit(5)
    @wonderfuls_url = IColumnData.where(i_column_type_id: 16, position: 0).first
    @images_url = IColumnData.where(i_column_type_id: 2, position: 0).first
    @design_url = IColumnData.where(i_column_type_id: 3, position: 0).first
    @i_banner = IBanner.page_name("刷新实录")
  end

  def show
    @life_memoir = ILifeMemoir.find params[:id]
    @i_column_data = IColumnData.where(i_column_type_id: 1, position: 0).first
    @url = @i_column_data.url if @i_column_data
    @i_column_datas = IColumnData.show_data(1)
    @i_banner = IBanner.page_name("刷新实录视频页")
  end

  def get_data
    @designs = IColumnData.show_data(3).limit(5)
    @images = IColumnData.show_data(2).limit 5
    @design_more = IColumnData.where(i_column_type_id: 2, position: 0).first
    @weekly_star_more = IColumnData.where(i_column_type_id: 3, position: 0).first
  end

  def re_list

  end
end
