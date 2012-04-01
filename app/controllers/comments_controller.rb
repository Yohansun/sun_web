class CommentsController < ApplicationController
	def create
		@comment = Comment.new(params[:comment])
		@comment.user_id = 1 #current_user.id
		@comment.save
		redirect_to inspiration_path(@comment.inspiration_id)
	end
end
