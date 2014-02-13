class DialogCelebrity::CelebrityQuestionRepliesController < ApplicationController
  def reply
    if !current_user.designer?
      return render :js => "alert('没有权限')"
    end
    @reply = CelebrityQuestionReply.create params[:celebrity_question_reply]
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
