# -*- encoding : utf-8 -*-
require 'rest_client'
class HomeSweeper < ActionController::Caching::Sweeper
  observe HomeRecommend, HomeKv, HomeBanner, FitLiteral, FitImage, Question, OwnerEnter,
          HomeImageLibPhoto, HomeDesignShow, HomeLifeVideo, IBanner

  def after_create(home)
    expire_cache
  end

  def after_update(home)
    expire_cache
  end

  def after_destroy(home)
    expire_cache
  end

  def expire_cache
    expire_action(:controller => '/home', :action => 'index')
    params = {
      :username => "icolor",
      :password => ">gn3W6<GE@",
      :task => {
        :urls => ["http://www.icolor.com.cn/"],
        :callback => {"url" => "",
                      "email" => ["xiaofei@networking.io"],
                      "acptNotice" => true
                      }
      }
    }
    begin
      RestClient.post('https://r.chinacache.com/content/refresh', params)
    rescue
      logger.debug("连接CDN失败！")
    end
  end
end