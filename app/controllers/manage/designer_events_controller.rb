# encoding: utf-8
class Manage::DesignerEventsController < Manage::BaseController

  def index
    time_type = params[:time_type]
    data_start = params[:data_start]
    data_end = params[:data_end]
    title = params[:title].strip if params[:title].present?

    if data_start.present? && data_end.present? && time_type.present?
      if title.present?
        @designer_events = DesignerEvent.where("#{time_type} BETWEEN ? AND ? AND title LIKE ? AND is_save = 1", data_start, data_end, "%#{title}%").order("#{time_type} DESC").page(params[:page]).per(10)
      else
        @designer_events = DesignerEvent.where("#{time_type} BETWEEN ? AND ? AND is_save = 1", data_start, data_end).order("#{time_type} DESC").page(params[:page]).per(10)
      end
    else
      @designer_events = DesignerEvent.where(:is_save => true).order("created_at DESC").page(params[:page]).per(10)
    end
  end

  def new
    @designer_event = DesignerEvent.new
  end

  def create
    @designer_event = DesignerEvent.find_by_id(session[:designer_event_id])
    if @designer_event
      params[:designer_event].merge!("is_save" => "1")
      @designer_event.update_attributes(params[:designer_event])
      session[:designer_event_id] = nil
    end
    render js: "alert('保存成功!');location.href='/manage/designer_events';"
  end

  def create_image
    result = "上传失败"
    @designer_event = DesignerEvent.find_or_initialize_by_id(session[:designer_event_id])
    @designer_event.file = params[:file]
    if @designer_event.save
      session[:designer_event_id] = @designer_event.id
      result = "上传成功"
    end
    render :json => {:notify => result, :path => @designer_event.file.url(:list)}, :layout => false
  end

  def edit
    @designer_event = DesignerEvent.find(params[:id])
  end

  def update
    @designer_event = DesignerEvent.find(params[:id])
    @designer_event.update_attributes(params[:designer_event]) if @designer_event
    render js: "alert('保存成功!');location.href='/manage/designer_events';"
  end

  def update_image
    result = "上传失败"
    @designer_event = DesignerEvent.find(params[:designer_event_id])
    @designer_event.file = params[:file]
    if @designer_event.save
      result = "上传成功"
    end
    render :json => {:notify => result, :path => @designer_event.file.url(:list)}, :layout => false
  end

  def destroy
    designer_event = DesignerEvent.find(params[:id])
    designer_event.destroy if designer_event
    render js: "location.reload();"
  end
end
