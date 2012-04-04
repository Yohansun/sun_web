class DesignsController < ApplicationController
  def index
    render :template => "users/designs" if params[:user_id]
  end
end
