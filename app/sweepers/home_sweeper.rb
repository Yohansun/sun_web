require 'rest_client'
class HomeSweeper < ActionController::Caching::Sweeper
  observe HomeRecommend, HomeKv, MasterProfile, HomeBanner, FitLiteral, FitImage, Question, OwnerEnter,
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
      :password => "123_libang",
      :task => {
        :urls => ["http://www.icolor.com.cn/"],
        :callback => {"url" => "",
                      "email" => ["xiaofei@networking.io"],
                      "acptNotice" => true
                      }
      }
    }
    # RestClient.post('https://r.chinacache.com/content/refresh', params)
  end
end