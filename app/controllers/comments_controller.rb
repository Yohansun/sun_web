class CommentsController < ApplicationController
	def create
		@comment = Comment.new(params[:comment])
		@comment.user_id = current_user.id
		@comment.save
    case @comment.commentable_type
    when 'Design'
      redirect_to user_design_path(@comment.commentable.user_id, @comment.commentable.id)
    when 'Faq'
      redirect_to faq_path(@comment.commentable.id)
    when 'Post'
      redirect_to "/master_topics/#{@comment.commentable.id}"
    when 'ColorDesign'
      redirect_to "/color_designs/#{@comment.commentable.id}"
    when 'Inspiration'
      redirect_to user_inspiration_path(@comment.commentable.user_id, @comment.commentable.id)
    else
    end
  end
end