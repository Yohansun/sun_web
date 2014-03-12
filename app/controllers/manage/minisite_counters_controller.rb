# encoding: utf-8
class Manage::MinisiteCountersController < Manage::BaseController

  def index
    data_start = params[:data_start]
    data_end = params[:data_end]

    if data_start.present? && data_end.present?
      @love_stories_all = LoveStory.where("created_at BETWEEN ? AND ?", data_start, data_end).order("id DESC")
      @love_stories = @love_stories_all.page(params[:page]).per(10)
    else
      @love_stories_all = LoveStory.order("id DESC")
      @love_stories = @love_stories_all.page(params[:page]).per(10)
    end

    respond_to do |f|
      f.html
      f.xls
    end
  end
end
