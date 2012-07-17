class MessagesController < ApplicationController
  before_filter :find_user

  def index
    if @user
      @messages = @user.messages.page params[:page]
    end

    load_skin
  end

  def create
    if params[:message] && @user
      params[:message][:from_user_id] = current_user.id
      @user.messages.create(params[:message])
    end
    redirect_to user_messages_path
  end

  def destroy
    @user.messages.find(params[:id]).destroy
    redirect_to user_messages_path(@user)
  end

  def reply
    #@message = Message.new(params[:message])
  end
end
