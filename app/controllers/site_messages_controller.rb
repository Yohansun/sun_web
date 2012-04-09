class SiteMessagesController < ApplicationController
  before_filter :find_user

  def index
    render :template => "users/site_messages" if @user
  end

  def show
    render :template => "#{controller_name}/users/#{action_name}" if params[:user_id]
  end

  def create
    @site_message = SiteMessage.new(params[:site_message])
    @site_message.user_id = current_user.id
    create! do |succ, fail|
      succ.js { render 'success' }
      fail.js { render 'fail' }
    end
  end
end
