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
      render :action => 'create'
    else
      render :action => 'fail'
    end
  end
end