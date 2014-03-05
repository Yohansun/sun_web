# encoding: utf-8
class LoveStory::LoveStoryActivitiesController < LoveStory::BaseController
  caches_action :index, :expires_in => 7.days
  caches_action :disclaimer, :expires_in => 7.days
  def index
    expires_in 7.days, 'max-stale' => 8.days, :public => true
  end
  def disclaimer
    expires_in 7.days, 'max-stale' => 8.days, :public => true
  end
end
