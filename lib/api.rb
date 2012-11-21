# -*- encoding : utf-8 -*-
require "open-uri"
require "api/entities"
require "api/helpers"

module Icolor
  class API < Grape::API
    prefix "api"
    error_format :json

    helpers APIHelpers

    resource :users do      

      get do
        # 获取用户基本信息
        # 方法: GET
        # URL: /api/users.json&user=
        # 接收参数: provider : EMALL用户的登录类型 ”autologin, login“
        #         key      : 用户名和当前日期的MD5值
        #         password : 当为login时传递的参数

        authenticate_emall!

        present emall_user, :with => APIEntities::User
      end

      post do
        
        # 同步用户数据,21_MINISITE活动
        # 方法: POST
        # URL: /api/users.json
        # 接收参数: user    : sina的用户名 ”唯一“ ”必填“
        #         id      : minisite注册用户的ID ”唯一“ ”必填“
        #         email   : 用户的邮箱 ”唯一“
        #         phone   : 用户的电话 ”唯一“
        #         sex     : 用户性别 “1:男 0:女”
        #         location: 用户的所在地 “区”
        #         uid     : sina用户的UID
        #         role    : 用户的身份 “designer0: 设计师在职 designer1: 设计师在读 company: 家装公司 user: 普通用户”
        #         auth    : 用户绑定社区数据 "类型: Array 
        #                                  参数: provider: 第三方绑定的类型, uid: 第三方用户的UID, is_binding: Boolean类型, access_token: 第三方返回的access_token
        #                                  例子: auth => [{"provider" => "weibo","is_binding" => true,"uid" => "","access_token"=>""},{"provider" => "qq_connect","is_binding" => true,"uid" => "","access_token"=>""},{"provider" => "renren","is_binding" => true,"uid" => "","access_token"=>""}]
        # 已经对auth参数转换,                类型: Hash
        #  例子: auth = {"provider" => "weibo","is_binding" => true,"uid" => "","access_token"=>""}

        #1. flash传weibo uid和access token 过来，我们验证uid和access token是否存在，并返回对应数据。
        if params[:id].present? && params['email'].present? && params['password'].present? && params[:user].present?
          user = User.where(name: params[:user]).first
          if !user.present?
            user = User.new
          end
          user.minisite_id = params['id']
          user.username    = user.name = params['user']
          user.password    =  user.password_confirmation = params['password']
          user.email       = params['email']
          user.phone       = params['phone']          
          user.sex         = params['sex']
          user.area_id     = Area.find_by_name(params['location']).try(:id)
          user.is_read     = true
          user.is_from_minisite = true

          case params['role']
            when "designer1" then user.role_id,user.des_status = 1, 1
            when "designer0" then user.role_id,user.des_status = 1, 0
            when "company"   then user.role_id = 2
            when "user"      then user.role_id = 3
          end

          if user.save
            if params['auth'].present?
              new_token = user.user_tokens.new(provider: params['auth']['provider'], uid: params['auth']['uid'], is_binding: params['auth']['is_binding'], access_token: params['auth']['access_token'])
              if new_token.save!
                error!({ "error" => "UpdateUserError", "detail" => "注册并绑定成功" }, 200)
              else
                error!({ "error" => "UpdateUserError", "detail" => "绑定失败:#{new_token.errors.messages}" }, 200)
              end
              #TODO error handling
            else
              error!({ "error" => "UpdateUserError", "detail" => "绑定失败：缺少auth对象" }, 200)
            end
          else
            error!({ "error" => "UpdateUserError", "detail" => user.errors.messages }, 200)
          end 
          
        else
          if (user = current_user)
            user.update_attribute :minisite_id, params['id'] if params['id']

            if params['auth'].present?
              unless get_user_tokens(params['auth']['uid'],params['auth']['access_token'])
                new_token = user.user_tokens.new(provider: params['auth']['provider'], uid: params['auth']['uid'], is_binding: params['auth']['is_binding'], access_token: params['auth']['access_token'])
                if new_token.save!
                  error!({ "error" => "UpdateUserError", "detail" => "绑定成功" }, 200)
                else
                  error!({ "error" => "UpdateUserError", "detail" => "绑定失败:#{new_token.errors.messages}" }, 200)
                end
                #TODO error handling
              else
                error!({ "error" => "UpdateUserError", "detail" => "UID和access_token已被用户绑定" }, 200)
              end
            else
              error!({ "error" => "UpdateUserError", "detail" => "绑定失败：缺少auth对象" }, 200)
            end
          else
            puts 'goes here'
            error!({ "error" => "UpdateUserError", "detail" => "该用户不存在?" }, 200)
          end
        end   
      end 
    end

    resource :moods do

      post do
        # 同步用户心情
        # 方法: POST
        # URL: /api/moods.json
        # 接收参数:  
        #          user       : sina的用户名 ”唯一“ ”必填“
        #          content    : 内容
        #          is_privacy : 是否公开 ”Boolean类型“
        #          color_code : 心情颜色值
        #          color_name : 心情颜色名称
        #          font_color : 字体颜色
        #          images     : 上传的图片URL地址 ”http://..开头“ “选填”
        #

        authenticate!

        mood            = current_user.moods.new
        mood.content    = params['content']
        mood.is_privacy = params['is_privacy']
        mood.color_code = params['color_code']
        mood.color_name = params['color_name']
        mood.font_color = params['font_color']
        img_url         = (params['images'].present? && params['images'].match(%r(^http://))) ?  params['images'] : nil

        if img_url
          img = open(img_url) rescue nil
          next unless img
          img.class.class_eval { attr_accessor :original_filename, :content_type }
          img.original_filename = img_url.split("/").last
          img.content_type = MIME::Types.type_for(img.original_filename).to_s
          mood.img = img
        end

        unless mood.save
          error!({ "error" => "UpdateMoodError", "detail" => mood.errors.messages }, 200)
        end
      end
    end

    resource :designs do
      # 更新推荐作品
      # 方法: POST
      # URL: /api/designs.json
      # 接收参数: user            : sina的用户名 ”唯一“ ”必填“
      #         title           : 作品名称 ”必填“
      #         content         : 设计理念 ”必填“
      #         reason          : 推荐理由 ”必填“
      #         style           : 风格 
      #         design_color    : 色系 ”类型: Array“ ”必填“
      #         recommend_color : 选择色号 
      #         location        : 作品建筑所属城市 “区” ”必填“
      #         tag_list        : 标签 ”以逗号分隔的字符串“
      #         images          : 作品URL ”类型: Array [url1,url2]”
      #
      
      post do
        authenticate!

        design              = current_user.designs.new
        design.title        = params['title']
        design.content      = params['content']
        design.reason       = params['reason']
        design.style        = params['style']
        design.design_color = params['design_color']
        design.recommend_color_category1 = params['recommend_color']
        design.tag_list     = params['tag_list']
        design.area_id      = Area.find_by_name(params['location']).try(:id)

        if design.save
          if params["images"].present?
            params["images"].each do |url|
              design_image = current_user.design_images.new

              file_url = url.match(%r(^http://)) ? url : nil

              if file_url
                file = open(file_url) rescue nil
                next unless file
                file.class.class_eval { attr_accessor :original_filename, :content_type }
                file.original_filename = file_url.split("/").last
                file.content_type = MIME::Types.type_for(file.original_filename).to_s
                design_image.file = file
                design_image.imageable = design

                error!({ "error" => "UpdateDesignImageError", "detail" => design.errors.messages }, 200) unless design_image.save
              end
            end
          else
            error!({ "error" => "UpdateDesignImageError", "detail" => "参数images不能为空!" }, 200)
          end  
        else
          error!({ "error" => "UpdateDesignError", "detail" => design.errors.messages }, 200)
        end
      end  
    end

    resource :inspirations do
      # 更新灵感秀
      # 方法: POST
      # URL: /api/designs.json
      # 接收参数: user            : sina的用户名 ”唯一“ ”必填“
      #         title           : 作品名称 ”必填“
      #         content         : 设计理念 ”必填“
      #         images          : 作品URL ”类型: Array [url1,url2]”
      #

      post do
        authenticate!

        inspiration         = current_user.inspirations.new
        inspiration.title   = params['title']
        inspiration.content = params['content']

        if inspiration.save
          if params["images"].present?
            params["images"].each do |url|
              inspiration_image = current_user.design_images.new

              file_url = url.match(%r(^http://)) ?  url : nil

              if file_url
                file = open(file_url) rescue nil
                next unless file
                file.class.class_eval { attr_accessor :original_filename, :content_type }
                file.original_filename = file_url.split("/").last
                file.content_type = MIME::Types.type_for(file.original_filename).to_s
                design_image.file = file
                inspiration_image.imageable = inspiration

                error!({ "error" => "UpdateInspirationImageError", "detail" => inspiration.errors.messages }, 200) unless inspiration_image.save
              end
            end
          else
            error!({ "error" => "UpdateInspirationImageError", "detail" => "参数images不能为空!" }, 200)
          end
        else
          error!({ "error" => "UpdateInspirationError", "detail" => inspiration.errors.messages }, 200)
        end
      end
    end
  end
end