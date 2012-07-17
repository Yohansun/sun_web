# -*- encoding : utf-8 -*-
class ReplyMsgsController < ApplicationController
  def create
    @reply_msg         = ReplyMsg.new(params[:reply_msg])
    @reply_msg.user_id = current_user.id
    @reply_msg.save

    user_display_name = current_user.display_name
    user_id           = current_user.id

    if params[:reply_msg][:reply_type] == "messages"
      user_of_comment = Message.find(params[:reply_msg][:message_id])
    else
      user_of_comment = Comment.find(params[:reply_msg][:comment_id])
    end

    if user_of_comment.respond_to? :commentable_type
      re_url = "/" + user_of_comment.commentable_type.try(:tableize) + "/" + user_of_comment.try(:commentable_id).to_s
    end  

    SysMsg.create( :content => (I18n.t "activerecord.sys_msg.reply_content", :user_of_comment => user_of_comment.user.display_name, :reply_module => SysMsg::MODULE["#{@reply_msg.reply_type}".to_sym]),
                   :reply_type => @reply_msg.reply_type,
                   :status => SysMsg::Status[0],
                   :reply_name => user_display_name,
                   :reply_id => user_id,
                   :user_id => user_of_comment.user.id,
                   :re_url => re_url
                )

    case @reply_msg.reply_type
      when 'master_topics'
        redirect_to "/master_topics/#{params[:reply_msg][:show_id]}"
      when 'weekly_stars'
        redirect_to "/weekly_stars/#{params[:reply_msg][:show_id]}"
      when 'designs'
        redirect_to user_design_path(@reply_msg.user.id, params[:reply_msg][:show_id])
      when 'inspirations'
        redirect_to inspiration_path(params[:reply_msg][:show_id])
      when 'color_designs'
        redirect_to "/color_designs/#{params[:reply_msg][:show_id]}"
      when 'events'
        redirect_to "/events"
      when 'messages'
        redirect_to user_messages_path(params[:reply_msg][:show_id])
    end
  end
end