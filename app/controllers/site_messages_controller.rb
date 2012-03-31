class SiteMessagesController < ApplicationController
  def index
    render :template => "#{controller_name}/users/#{action_name}" if params[:user_id]
  end

  def show
    render :template => "#{controller_name}/users/#{action_name}" if params[:user_id]
  end

  def create
    create! do |succ, fail|
      succ.js { render 'success' }
      fail.js { render 'fail' }
    end
  end
end
