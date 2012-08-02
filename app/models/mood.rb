#encoding:utf-8
class Mood < ActiveRecord::Base
	include HTTMultiParty

  attr_accessible :content, :img, :is_privacy, :color_code, :shares_count, :color_name, :font_color

  belongs_to :user
  has_attached_file :img,
									  :styles => {:thumb => "125x117#"},
									  :whiny_thumbnails => true,
									  :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
									  :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

  def self.send_weibo(args)

    response = post("https://api.weibo.com/2/statuses/update.json",
      :body => {
        :access_token => args[:access_token],
        :status => args[:content]
        })

    response.parsed_response
  end

  def self.send_qq_connect(args)

    response = post("https://graph.qq.com/t/add_t",
      :body => {
        :access_token => args[:access_token],
        :oauth_consumer_key => 100255284,
        :openid => args[:openid],
        :format => 'json',
        :content => args[:content]
        })

    response.parsed_response
  end

  def self.send_kaixin(args)

    response = post("https://api.kaixin001.com/records/add",
      :body => {
        :access_token => args[:access_token],
        :content => args[:content]
        })

    response.parsed_response
  end

  def self.send_renren(args)
    response = post("http://api.renren.com/restserver.do", :body => build_params(args))
    response.parsed_response
  end

  protected

  def self.build_params(args)
    secret_key = "9fd3b3435051414db2162f56025aeb03"
    params = {}
    params[:v] = '1.0'
    params[:method] = 'feed.publishFeed'
    params[:name] = 'iColor彩色心情'
    params[:description] = args[:content]
    params[:access_token] = args[:access_token]
    params[:url] = 'http://www.icolor.com.cn'
    params[:sig] = Digest::MD5.hexdigest(params.map{|k,v| "#{k}=#{v}"}.sort.join + secret_key)
    params
  end

end
