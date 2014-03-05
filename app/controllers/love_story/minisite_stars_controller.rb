# encoding: utf-8
class LoveStory::MinisiteStarsController < LoveStory::BaseController
  caches_action :index, :cache_path => Proc.new { |c| c.params }, :expires_in => 7.days
  def index
    @users = User.where("top50 = ?",true).page(params[:page]).per(24)
    expires_in 7.days, 'max-stale' => 8.days, :public => true
  end
end
