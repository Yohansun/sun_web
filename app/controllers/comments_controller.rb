class CommentsController < ApplicationController
  def create
    @comment         = Comment.new(params[:comment])
    @comment.user_id = current_user.id if current_user
    @comment.save
    current_user.comment_score(current_user, params[:comment]) if current_user
    case @comment.commentable_type
      when 'Design'
        redirect_to user_design_path(@comment.commentable.user_id, @comment.commentable.id)
      when 'Faq'
        redirect_to faq_path(@comment.commentable.id)
      when 'Post'
        redirect_to "/master_topics/#{@comment.commentable.id}"
      when 'ColorDesign'
        redirect_to "/color_designs/#{@comment.commentable.id}"
      when 'WeeklyStar'
        redirect_to "/weekly_stars/#{@comment.commentable.id}"
      when 'Inspiration'
        redirect_to user_inspiration_path(@comment.commentable.user_id, @comment.commentable.id)
      when 'FakeEvent'
        redirect_to "/events"
      when 'MasterVideo'
        redirect_to "/events/#{@comment.commentable.id}"
      else
    end
  end
end