class Mood < ActiveRecord::Base
	include HTTMultiParty

  attr_accessible :content, :img, :is_privacy, :color_code, :shares_count, :color_name, :font_color

  belongs_to :user
  has_attached_file :img,
									  :styles => {:thumb => "125x117#"},
									  :whiny_thumbnails => true,
									  :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
									  :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

  def self.send_weibo(access_token, content)

    response = post("https://api.weibo.com/2/statuses/update.json",
      :body => {
        :access_token => access_token,
        :status => content
        })

    response.parsed_response
  end

  def self.send_qq(access_token, openid, content)

    response = post("https://graph.qq.com/t/add_t",
      :body => {
        :access_token => access_token,
        :oauth_consumer_key => 100255284,
        :openid => openid,
        :format => 'json',
        :content => content
        })

    response.parsed_response
  end

  def self.send_kaixin(access_token, content)

    response = post("https://api.kaixin001.com/records/add",
      :body => {
        :access_token => access_token,
        :content => content
        })

    response.parsed_response
  end
end
