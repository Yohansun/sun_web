# -*- encoding : utf-8 -*-
class RepRepliesController < ApplicationController
  def create
      @reply_msg         = RepReply.new(params[:rep_reply])
      @reply_msg.user_id = current_user.id#个人主页的主人
      @reply_msg.reply_id = params[:rep_reply][:reply_id]#回复那条评论的id
      @reply_msg.save
      redirect_to user_asks_path(params[:rep_reply][:show_id])
  end
  def index
    
  end
end