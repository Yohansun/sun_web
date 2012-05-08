class VotesController < ApplicationController
  before_filter :find_user

  def create
    vote = Vote.new
    vote.ip = request.remote_ip
    vote.voteable_id = params[:voteable_id]
    vote.voteable_type = params[:voteable_type]
    debugger
    if !current_user.blank? && check_voted(current_user, params)
      debugger
      vote.user_id = current_user.id
      if vote.save!
        current_user.vote_score(current_user, params[:voteable_type], params[:voteable_id])
        render :action => 'create'
      else
        render :action => 'fail'
      end
    else
      render :action => "fail"
    end
  end

  private

  def check_voted(user, vote)
    vote = Vote.where(:voteable_type => vote[:voteable_type], :voteable_id => vote[:voteable_id], :user_id => user.id)
    if vote 
      return false
    else
      return true
    end
  end
end