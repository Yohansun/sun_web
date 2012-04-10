# -*- encoding : utf-8 -*-

require "open-uri"

class WeiboData < ActiveRecord::Base
  # attr_accessible :title, :body
  validates_uniqueness_of :idstr

  def self.fetch(page = 1)
    q = '放飞色彩心愿清单'
    data = open("http://api.weibo.com/2/search/topics.json?source=337220139&q=#{CGI.escape(q)}&count=50&page=#{page}").read
    lines = JSON.parse(data.force_encoding("UTF-8"))
    lines['statuses'].each do |status|
      WeiboData.create(:q => q, :idstr => status['idstr'], :text => status['text'],
        :source => status['source'], :thumbnail_pic => status['thumbnail_pic'],
        :bmiddle_pic => status['bmiddle_pic'], :original_pic => status['original_pic'],
        :user_id => status['user']['id'], :user_screen_name => status['user']['screen_name'],
        :user_name => status['user']['name'],
        :user_profile_image_url => status['user']['profile_image_url'],
        :user_profile_url => status['user']['profile_url'],
        :user_gender => status['user']['gender'], :user_location => status['user']['location'],
        :user_description => status['user']['description'], :created_time => status['created_at'] )
    end
  end
end