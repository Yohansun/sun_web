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

  def ask_for_minisite
    data_start = params[:data_start]
    data_end = params[:data_end]

    if data_start.present? && data_end.present?
      @asks_all = Reply.where("created_at BETWEEN ? AND ?", data_start, data_end).order("id DESC")
      @asks = @asks_all.page(params[:page]).per(10)
    else
      @asks_all = Reply.where(genre: '2014为爱刷新邀约设计').order("id DESC")
      @asks = @asks_all.page(params[:page]).per(10)
    end

    respond_to do |f|
      f.html
      f.xls
    end
  end
end
