# encoding: utf-8
class Manage::OtherEventsController < Manage::BaseController

  def index
    time_type = params[:time_type]
    data_start = params[:data_start]
    data_end = params[:data_end]
    title = params[:title].strip if params[:title].present?

    if data_start.present? && data_end.present? && time_type.present?
      if title.present?
        @other_events = DesignerEvent.page_name(controller_name).where("#{time_type} BETWEEN ? AND ? AND title LIKE ? AND is_save = 1", data_start, data_end, "%#{title}%").order("#{time_type} DESC").page(params[:page]).per(10)
      else
        @other_events = DesignerEvent.page_name(controller_name).where("#{time_type} BETWEEN ? AND ? AND is_save = 1", data_start, data_end).order("#{time_type} DESC").page(params[:page]).per(10)
      end
    else
      @other_events = DesignerEvent.page_name(controller_name).where(:is_save => true).order("created_at DESC").page(params[:page]).per(10)
    end
  end

  def new
    @other_event = DesignerEvent.new
  end

  def create
    @other_event = DesignerEvent.find_by_id(session[:other_event_id])
    if @other_event
      params[:other_event].merge!("is_save" => "1")
      @other_event.update_attributes(params[:other_event])
      session[:other_event_id] = nil
    end
    render js: "alert('保存成功!');location.href='/manage/other_events';"
  end

  def create_image
    result = "上传失败"
    @other_event = DesignerEvent.find_or_initialize_by_id(session[:other_event_id])
    @other_event.file = params[:file]
    if @other_event.save
      session[:other_event_id] = @other_event.id
      result = "上传成功"
    end
    render :json => {:notify => result, :path => @other_event.file.url(:list)}, :layout => false
  end

  def edit
    @other_event = DesignerEvent.find(params[:id])
  end

  def update
    @other_event = DesignerEvent.find(params[:id])
    @other_event.update_attributes(params[:other_event]) if @other_event
    render js: "alert('保存成功!');location.href='/manage/other_events';"
  end

  def update_image
    result = "上传失败"
    @other_event = DesignerEvent.find(params[:other_event_id])
    @other_event.file = params[:file]
    if @other_event.save
      result = "上传成功"
    end
    render :json => {:notify => result, :path => @other_event.file.url(:list)}, :layout => false
  end

  def destroy
    other_event = DesignerEvent.find(params[:id])
    other_event.destroy if other_event
    render js: "location.reload();"
  end
end
