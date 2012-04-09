# -*- encoding : utf-8 -*-
class HomeController < ApplicationController

  def index
    #    get_weibo_data
    @weibo_datas = WeiboData.where(:q => "放飞色彩心愿清单")
  end

  def weibo_data
    app_key = "337220139"
    q_word = "放飞色彩心愿清单"
    url = "http://api.weibo.com/2/search/topics.json"

    uri = URI(url)
    params = { :source => app_key, :q => q_word, :count => 2 }
    uri.query = URI.encode_www_form(params)

    res = Net::HTTP.get_response(uri)
#    @weibo_datas = []
    if res.is_a?(Net::HTTPSuccess)
      @result = JSON.parse(res.body.force_encoding("UTF-8"))
      @result["statuses"].each do |wb|
        ####FIXME 重复数据！！！#####
        data = WeiboData.new( :q => q_word, :status => 1, :weibo_time => wb["created_at"],
                              :weibo_content => wb["text"], :img_url => wb["thumbnail_pic"],
                              :weibo_username => wb["user"]["name"], :get_time => Time.now
                            )
        data.save
        #@weibo_datas << data
      end
    end
#    @weibo_datas
  end
end