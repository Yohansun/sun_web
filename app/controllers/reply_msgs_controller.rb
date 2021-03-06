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

    SysMsg.create( :content => (I18n.t "activerecord.sys_msg.reply_content", :user_of_comment => user_of_comment.try(:user).try(:display_name), :reply_module => SysMsg::MODULE["#{@reply_msg.reply_type}".to_sym]),
                   :reply_type => @reply_msg.reply_type,
                   :status => SysMsg::Status[0],
                   :reply_name => user_display_name,
                   :reply_id => user_id,
                   :user_id => user_of_comment.try(:user).try(:id),
                   :re_url => re_url
                )

    case @reply_msg.reply_type
      when 'master_topics'
        redirect_to "/master_topics/#{params[:reply_msg][:show_id]}"
      when 'weekly_stars'
        redirect_to "/weekly_stars/#{params[:reply_msg][:show_id]}"
      when 'designs'
        
        if request.headers['referer'].match %r(design_competes)
          redirect_to request.headers['referer']
        else 
          redirect_to user_design_path(@reply_msg.user.id, params[:reply_msg][:show_id])
        end
      when 'design_works'
        redirect_to design_work_path(params[:reply_msg][:show_id])
      when 'stories'
        redirect_to story_path(params[:reply_msg][:show_id])
      when 'design_images'
        redirect_to image_show_design_image_path(params[:reply_msg][:show_id])
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

  def destroy
    @reply_msg = ReplyMsg.find(params[:id])
    if @reply_msg.destroy
      flash[:notice] = "删除成功"
    else
      flash[:alert] = "删除失败"
    end
    redirect_to :back
  end
end