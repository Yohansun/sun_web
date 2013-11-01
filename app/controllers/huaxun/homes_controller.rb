class Huaxun::HomesController < ApplicationController
  layout 'huaxun'
  before_filter :is_sign, :only => [:index]
  def index

  end

  def login
    redirect_to homes_path if current_user && current_user.genre == 'huaxun'
  end
end
