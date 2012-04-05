# -*- encoding : utf-8 -*-
class EventsController < ApplicationController
  before_filter :find_user
  
  def index
    if @user
      @events = @user.events.page params[:page]
      render :template => "users/events"
    else
      @events = Event.page params[:page], :per_page => 9
    end
  end

  def new
    @event = current_user.events.new
  end

  def create
    @event = Event.new(params[:event])
    @event.end_at = params[:event][:begin_at]
    @event.begin_time = params[:date][:begin_time]
    @event.end_time = params[:date][:end_time]
    @event.user_id = current_user.id if current_user
    #TODO where is session[:user_role]???
    if current_user #&& (current_user.role.role.eql? session[:user_role])
      if @event.save
        redirect_to user_events_path
      else
        render :action => "new"
      end
    end
  end

  def edit
    @event = current_user.events.where(:id => params[:id])
  end

  def show

  end

end
