# -*- encoding : utf-8 -*-
class RefreshRecordController < ApplicationController
  layout "home_manage"
  before_filter :get_data
  def index
    @kv = HomeKv.where(position: nil, visible: true).first
    @life_memoirs = ILifeMemoir.order("created_at desc").page(params[:page]).per(4)
    @wonderfuls = IColumnData.show_data(17).limit(5)
    @wonderfuls_url = IColumnData.where(i_column_type_id: 17, position: 0).first
    @images_url = IColumnData.where(i_column_type_id: 2, position: 0).first
    @design_url = IColumnData.where(i_column_type_id: 3, position: 0).first
    @i_banner = IBanner.page_name("刷新实录")
  end

  def show
    @life_memoir = ILifeMemoir.find params[:id]
  end

  def get_data
    @designs = IColumnData.show_data(3).limit(5)
    @images = IColumnData.show_data(2).limit 5
  end
  
end
