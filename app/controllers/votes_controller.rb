class VotesController < ApplicationController
  def create
    vote = Vote.new
    vote.ip = request.remote_ip
    vote.voteable_id = params[:voteable_id]
    vote.voteable_type = params[:voteable_type]
    if current_user
      vote.user_id = current_user.id
    end
    if vote.save
      current_user.vote_score(current_user, params[:voteable_type], params[:voteable_id])
      render :action => 'create'
    else
      render :action => 'fail'
    end
  end
end