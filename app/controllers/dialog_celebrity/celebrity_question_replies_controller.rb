# encoding: utf-8
class DialogCelebrity::CelebrityQuestionRepliesController < ApplicationController
  def reply
    if current_user.blank?
      return render :js => "window.location.href='/users/sign_in'"
    end
    if !current_user.designer?
      return render :js => "alert('没有权限')"
    end
    @reply = CelebrityQuestionReply.create params[:celebrity_question_reply]
    if params[:images].present?
      image_ids = params[:images].split("|")
      image_ids.each do |image_id|
        image = CelebrityQuestionImage.find(image_id)
        image.resource = @reply
        image.save
      end
    end
    @content = render_to_string(partial: "dialog_celebrity/celebrity_question_replies/reply")
    respond_to do |format|
      format.js
    end
  end
  def delete
    reply = CelebrityQuestionReply.find(params[:id].to_i)
    question = reply.question
    if current_user.present? && (current_user.id == question.user_id || current_user.id == reply.user_id)
      reply.destroy
      render :text => "1"
    else
      render :js => "alert('没有权限')"
    end
  end
end
