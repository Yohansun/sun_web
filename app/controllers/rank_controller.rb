class RankController < ApplicationController
  def index
    render :template => "#{controller_name}/users/#{action_name}" if params[:user_id]
  end
end
