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
      end

      auth ? user : nil
    end

    def authenticate_emall!
      error!({ "error" => "401 Unauthorized", :suc => 'fail'}, 401) unless emall_user
    end  

    def authenticate!
      error!({ "error" => "401 Unauthorized"}, 401) unless current_user
    end

    def random_password
    	UUIDTools::UUID.random_create.hexdigest[0,10].upcase
   	end 

   	def get_user_tokens(provider,uid)   		
   		current_user.user_tokens.find_by_provider_and_uid(provider,uid) if current_user
   	end
  end
end