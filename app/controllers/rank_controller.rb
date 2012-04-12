class RankController < ApplicationController
  before_filter :find_user

  def index
    render :template => "users/rank" if @user
  end
end
