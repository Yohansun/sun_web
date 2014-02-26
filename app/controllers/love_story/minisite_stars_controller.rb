# encoding: utf-8
class LoveStory::MinisiteStarsController < LoveStory::BaseController
  caches_action :index, :expires_in => 7.days
  def index
    @users = User.where("top50 = ?",true).page(params[:page]).per(24)
  end
end
