# -*- encoding: utf-8 -*-
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def action_missing(provider)
    if !User.omniauth_providers.index(provider.to_sym).nil?
      omniauth = env["omniauth.auth"]

      case provider
      when "weibo"
        omniauth['uid'] = omniauth["extra"]["raw_info"]['id']
        omniauth['name'] = omniauth["extra"]["raw_info"]['name']
        omniauth['location'] = omniauth["extra"]["raw_info"]['location']
        omniauth['sex'] = omniauth["extra"]["raw_info"]['gender'] == 'm' ? 1 : 0
        omniauth['access_token'] = omniauth["credentials"]["token"]
      when "qq_connect"
        omniauth['name'] = omniauth["info"]["nickname"]
        omniauth['sex'] = omniauth["info"]["gender"] == '男' ? 1 : 0
        omniauth['access_token'] = omniauth["credentials"]["token"]
      when "renren"
        omniauth['name'] = omniauth["info"]["name"]
        omniauth['sex'] = omniauth["info"]["gender"] == 'Male' ? 1 : 0
      when "kaixin"
        omniauth['name'] = omniauth["info"]["name"]
        omniauth['sex'] = omniauth["info"]["gender"] == 'Male' ? 1 : 0
        omniauth['access_token'] = omniauth["credentials"]["token"]
      end

      if current_user

        user_token = current_user.user_tokens.find_or_create_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
        user_token.access_token = omniauth['access_token']

        #社区绑定时更新用户的access_token
        if user_token.changed? || user_token.access_token.blank?
          user_token.update_attribute :access_token, omniauth['access_token']
        end

        flash[:notice] = "Authentication successful"

        if request.env['omniauth.origin'].match %r(community)
          current_user.user_tokens.find_by_provider(provider).update_attribute :is_binding, true #更新社区绑定状态
          redirect_to request.env['omniauth.origin'] #设置社区绑定授权后的返回页面
        else
          redirect_to omniauth_user_user_path(current_user)
        end
        return
      else
        authentication = UserToken.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])

        if authentication

          authentication.access_token = omniauth['access_token']
          flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => omniauth['provider']

          #如果access_token为空或者过期更新access_token
          if authentication.changed? || authentication.access_token.blank?
            authentication.update_attribute :access_token, omniauth['access_token']
          end

          sign_in_and_redirect(:user, authentication.user)
          return
        else
          #create a new user
          unless omniauth.recursive_find_by_key("email").blank?
            user = User.find_or_initialize_by_email(:email => omniauth.recursive_find_by_key("email"))
          else
            user = User.new
          end

          user.apply_omniauth(omniauth)

          if user.save(:validate => false)
            flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => omniauth['provider']
            sign_in(:user, user)
            redirect_to stored_location_for(user)
            return
          else
            session[:omniauth] = omniauth.except('extra')
            redirect_to new_user_registration_url
            return
          end
        end
      end
    end
  end
end