# encoding: utf-8
class Manage::HomeController < Manage::BaseController

  def index
  end

  def clear_cache
    Rails.cache.clear
    render text: '页面缓存已清空！'
  end
end
