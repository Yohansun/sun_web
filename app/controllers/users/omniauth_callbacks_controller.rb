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
      end

      if current_user
        current_user.user_tokens.find_or_create_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
        flash[:notice] = "Authentication successful"
        redirect_to edit_user_registration_path
      else

        authentication = UserToken.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])

        if authentication
          flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => omniauth['provider']
          sign_in_and_redirect(:user, authentication.user)
        else
          #create a new user
          unless omniauth.recursive_find_by_key("email").blank?
            user = User.find_or_initialize_by_email(:email => omniauth.recursive_find_by_key("email"))
          else
            user = User.new
          end

          user.apply_omniauth(omniauth)

          if user.save
            flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => omniauth['provider']
            sign_in_and_redirect(:user, user)
          else
            session[:omniauth] = omniauth.except('extra')
            redirect_to new_user_registration_url
          end
        end
      end
    end
  end
end