# encoding: utf-8
class SmsCubit
  require "savon"

  attr_accessor :mobiles, :content, :client

  def initialize(content, mobiles)
    @content = content
    @mobiles = mobiles
    @client = Savon.client(wsdl: "http://134.127.17.174/MsgService/MsgService1069.asmx?WSDL")
  end

  def transmit
    message = { userName: 'ICOLOR_SMS',
                password: 'ICOLOR_SMS_123456',
                phoneNo: "#{@mobiles}",
                companyCode: 'lbtz',
                message: "#{@content}" }
    response = @client.call(:send_message, message: message)
    response.body[:send_message_response][:send_message_result]
  end
end
