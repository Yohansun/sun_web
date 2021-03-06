# -*- encoding : utf-8 -*-
class EventsController < ApplicationController
  before_filter :find_user

  def index
    if @user
      @events = @user.events.page params[:page]
      
      load_skin
    else
      comments  ||= Comment.where(:commentable_type => "FakeEvent")
      @comments ||= comments.page(params[:page]).per(6)
      @designers ||= MasterVideo.all
      @size     ||= comments.length
    end
  end

  def new
    @event = current_user.events.new
  end

  def create
    @event = Event.new(params[:event])
    @event.end_at = params[:event][:begin_at]
    @event.user_id = current_user.id if current_user
    if current_user #&& (current_user.role.role.eql? session[:user_role])
      if @event.save
        current_user.create_score(current_user.id, 1300, 1, 50)
        redirect_to user_events_path
      else
        render :action => "new"
      end
    end
  end

  def edit
    @event = current_user.events.find(params[:id])
    render :action => "new"
  end

  def update
    @event = current_user.events.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to user_events_path
    else
      render :action => 'new'
    end
  end

  def show
    @designers ||= MasterVideo.all
    @designer ||= MasterVideo.find(params[:id])
    @comments ||= Comment.where("commentable_id = ? and commentable_type = ?", params[:id], "MasterVideo").page(params[:page]).per(6)
  end

  def destroy
    current_user.events.find(params[:id]).destroy
    redirect_to user_events_path(current_user)
  end

  def my_event
    if @user
      @events = @user.events.page params[:page]
      render :template => "events/users/my_event"
    end
  end
end
