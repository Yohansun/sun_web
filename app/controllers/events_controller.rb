class EventsController < ApplicationController
  def index
    render :template => "#{controller_name}/users/#{action_name}" if params[:user_id]
  end

  def new
    render :template => "#{controller_name}/users/#{action_name}" if params[:user_id]
  end

  def edit
    render :template => "#{controller_name}/users/#{action_name}" if params[:user_id]
  end
end
