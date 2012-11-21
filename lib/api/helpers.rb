# -*- encoding : utf-8 -*-
require 'nkf'

module Icolor
  module APIHelpers
    # user helpers

    def current_user
    	User.where("name = :user", user: params[:user]).first
    end

    def emall_user
      username    = params[:user]
      password    = NKF.nkf '-r -s', (params[:password] ? params[:password] : "") 
      provider    = params[:provider]
      request_key = params[:key]
      date        = Time.now.strftime("%Y/%m/%d")

      #是否授权
      auth = false

      #查询数据库 
      user = User.find_for_database_authentication(:login => params[:user])

      if provider.eql? 'autologin'
        valid_key = Digest::MD5.hexdigest("username=#{username}date=#{date}")
        auth = true if valid_key.eql?(request_key) && user
      elsif provider.eql? 'login'
        auth = true if user && user.valid_password?(password)
      elsif provider.eql? 'minisite'
        auth = true if user && user.valid_password?(params[:password])
      end

      auth ? user : nil
    end

    def authenticate_emall!
      error!({ "error" => "200 Unauthorized", :suc => 'fail'}, 200) unless emall_user
    end  

    def authenticate!
      error!({ "error" => "200 Unauthorized"}, 200) unless current_user
    end

    def random_password
    	UUIDTools::UUID.random_create.hexdigest[0,10].upcase
   	end 

   	def get_user_tokens(uid,access_token)   	
      current_user.user_tokens.where(uid: uid,access_token: access_token).first if current_user
   	end
  end
end