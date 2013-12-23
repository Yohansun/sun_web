class DesignerEventsController < ApplicationController
  layout "home_manage"
  before_filter :get_data
  def index
    @event_ks = EventKv.first
    @active_now = DesignerEvent.active_now
    @active_period = DesignerEvent.active_period.page(params[:page]).per(1)
  end

  def show
    @active = DesignerEvent.find params[:id]
  end

  def get_data
    @master_interviews = IColumnData.show_data(6).limit(5)
    @master_more = IColumnData.where(i_column_type_id: 6,position: 0).first
    @about_info = IColumnData.show_data(7).limit(5)
    @more_info = IColumnData.where(i_column_type_id: 7,position: 0).first
    @master_design_datas = IColumnData.show_data(1).limit(5)
    @master_design_data_url = IColumnData.where(i_column_type_id: 1, position: 0).first
    @rrdrs = IColumnData.show_data(4).limit(5)
    @rrdr_url = IColumnData.where(i_column_type_id: 4, position: 0).first
  end
end
