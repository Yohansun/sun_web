class CommentsController < ApplicationController
	def create
		@comment = Comment.new(params[:comment])
		@comment.user_id = 1 #current_user.id
		@comment.save
    case @comment.commentable_type
    when 'Design'
      redirect_to user_design_path(@comment.commentable.user_id, @comment.commentable.id)
    else
      redirect_to user_inspiration_path(@comment.commentable.user_id, @comment.commentable.id)
    end
  end
end