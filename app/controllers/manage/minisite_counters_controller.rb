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

  def uploaded_designs
    data_start = params[:data_start]
    data_end = params[:data_end]

    if data_start.present? && data_end.present?
      @designs_all = Design.minisite_designs.where("created_at BETWEEN ? AND ?", data_start, data_end).order("id DESC")
      @designs = @designs_all.page(params[:page]).per(10)
    else
      @designs_all = Design.minisite_designs.order("id DESC")
      @designs = @designs_all.page(params[:page]).per(10)
    end

    respond_to do |f|
      f.html
      f.xls
    end
  end

  def sign_up_users
    data_start = params[:data_start]
    data_end = params[:data_end]

    if data_start.present? && data_end.present?
      @users = User.where("reg_at_minisite2014 = 1 AND created_at BETWEEN ? AND ?", data_start, data_end).order("id DESC")
    else
      @users = User.where(reg_at_minisite2014: true).order("id DESC")
    end
    @job_designer_users = @users.where(role_id: 1, des_status: 0)
    @school_designer_users = @users.where(role_id: 1, des_status: 1)
    @company_users = @users.where(role_id: 2)
    @normal_users = @users.where(role_id: 3)

    respond_to do |f|
      f.html
      f.xls
    end
  end
end
