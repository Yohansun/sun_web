# encoding: utf-8
class LoveStory::HomeController < LoveStory::BaseController
  caches_action :index, :cache_path => Proc.new { |c| c.params }, :expires_in => 7.days
  def index
  end
end
