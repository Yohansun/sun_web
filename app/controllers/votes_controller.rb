class VotesController < ApplicationController
  #before_filter :find_user

  def create
    vote = Vote.new
    vote.ip = request.remote_ip
    vote.voteable_id = params[:voteable_id]
    vote.voteable_type = params[:voteable_type]
    if !current_user.blank? && check_voted(current_user, params)
      vote.user_id = current_user.id
      if vote.save!
        current_user.vote_score(current_user, params[:voteable_type], params[:voteable_id])
        render :action => 'create'
      end
    elsif !current_user.blank?
      if !check_voted(current_user, params)
        render :action => "voted"
      end
    elsif current_user.blank?
      #vote.save!
      vote.save
      render :action => 'create'
      #render :action => 'fail'
    end
  end

  private

  def check_voted(user, params)
    vote = Vote.find(
                    :first, 
                    :conditions => ["voteable_type = ? and voteable_id = ? and user_id = ?", params[:voteable_type], params[:voteable_id], user.id]
                    )
    if vote.blank?
      return true
    else
      return false
    end
  end
end