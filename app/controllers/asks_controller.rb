# -*- encoding : utf-8 -*-
class AsksController < ApplicationController
	before_filter :find_user
	def index
	  if @user
        @messages = @user.replies.order("created_at desc").page(params[:page]).per(5)
      end
	end
	def create
	   if params[:message] && @user
	   	 if current_user
		     params[:message][:reply_user_id] = current_user.id
	     end  
	     @user.replies.create(params[:message])
	   end
	   redirect_to user_asks_path
	end
	def destroy
	  @user.replies.find(params[:id]).destroy
      redirect_to user_asks_path(@user)
	end
end