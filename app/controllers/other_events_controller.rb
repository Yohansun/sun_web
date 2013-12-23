# encoding: utf-8
class OtherEventsController < ApplicationController
  layout "home_manage"

  def index
    @event_kv = EventKv.includes(:kv_maps).page_name(controller_name).try(:first)
    @banners = IBanner.page_name('其它活动').order("position ASC").all
    @recent_events = DesignerEvent.page_name(controller_name).recent_events
    @finished_events = DesignerEvent.page_name(controller_name).finished_events.page(params[:page]).per(10)
    #大师访谈
    @master_interviews = IColumnData.show_data(6).limit(5)
    @master_more = IColumnData.where(i_column_type_id: 6,position: 0).first
    #相关资讯
    @about_info = IColumnData.show_data(7).limit(5)
    @more_info = IColumnData.where(i_column_type_id: 7,position: 0).first
  end
end
