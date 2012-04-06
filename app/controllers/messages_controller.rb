class MessagesController < ApplicationController
  before_filter :find_user

  def index
    if @user
      @messages = @user.messages.page params[:page]
      render :template => "users/messages"
    end
  end

  def create
    if params[:message] && @user
      params[:message][:from_user_id] = current_user.id
      @user.messages.create(params[:message])
    end
    redirect_to user_messages_path
  end

end
