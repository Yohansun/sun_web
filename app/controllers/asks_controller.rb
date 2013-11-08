# -*- encoding : utf-8 -*-
class AsksController < ApplicationController
	before_filter :find_user
	def index
	  if @user
        @messages = @user.replies.order("id desc").page(params[:page]).per(5)
      end
	end
	def create
	   if params[:message] && @user
	   	 if current_user
		     params[:message][:reply_user_id] = current_user.id
	     end
	     content = params[:message][:content]
	     @user.replies.create(params[:message])
	     Notifier.ask(@user, current_user, content).deliver
	   end
	   redirect_to user_asks_path
	end
	def destroy
	  @user.replies.find(params[:id]).destroy
      redirect_to user_asks_path(@user)
	end
end