# encoding: utf-8
class LoveStory::LoveStoryActivitiesController < LoveStory::BaseController
  caches_action :index, :expires_in => 7.days
  caches_action :disclaimer, :expires_in => 7.days
  def index

  end
  def disclaimer

  end
end
