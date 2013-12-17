# encoding: utf-8
class Manage::EventKvsController < Manage::BaseController

  def index
    if params[:klass_name].present?
      @event_kv = EventKv.page_name(params[:klass_name]).first
    else
      @event_kv = nil
    end
  end

  def create
    if params[:klass_name].present?
      event_kv = EventKv.page_name(params[:klass_name]).first
      event_kv.update_attribute(:url,params[:url]) if event_kv
    end
    render js: "alert('保存成功!');"
  end

  def create_image
    result = "上传失败"
    if params[:klass_name].present?
      event_kv = EventKv.page_name(params[:klass_name]).first
      if event_kv
        event_kv.file = params[:file]
      end
      if event_kv.save
        result = "上传成功"
      end
    end
    render :json => {:notify => result}, :layout => false
  end
end
