require 'rexml/document'
include REXML

class Sms
  require "savon"
  require "collections"
  
  attr_accessor :mobiles, :content, :client

  def initialize(content, mobiles)
    @content = content
    @mobiles = mobiles
    @client = Savon::Client.new("http://www.mdao.com/nippon/services/SMS?wsdl")
  end

  def transmit
    if Rails.env.production? 
      response = @client.request(:batch_send) do
        soap.body = "<loginName>user01</loginName><loginPswd>123456</loginPswd><mobiles>#{self.mobiles}</mobiles><content>#{self.content}</content><fixedTime></fixedTime><sendId></sendId><extid></extid>"
      end
      response.body[:batch_send_response][:out]
    else
      response = @client.request(:batch_send) do
        soap.body = "<loginName>user01</loginName><loginPswd>123456</loginPswd><mobiles>18039101897</mobiles><content>#{self.content}</content><fixedTime></fixedTime><sendId></sendId><extid></extid>"
      end
      response.body[:batch_send_response][:out]
    end
  end
end
