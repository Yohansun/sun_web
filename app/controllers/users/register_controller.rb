#encoding: utf-8

# -*- Encoding: UTF-8 -*-
class Users::RegisterController < Devise::RegistrationsController
  layout :layout_by_resource
  before_filter :reg_banner

  def create
    @messages = []
    if simple_captcha_valid?
      if params[:user][:user_role] =~ /designer/
        params[:user][:role_id] = Role.find_by_role("designer").id
        params[:user][:des_status] = params[:user][:user_role] == "designer_1"
      else
      #   if params[:user][:user_role].blank?
      #     params[:user][:user_role] = 'user'
      #   end
        params[:user][:role_id] = Role.find_by_role(params[:user][:user_role]).id unless params[:user][:user_role].blank?
      end



      build_resource
      resource.create_from = params[:return_to]
      if resource.save
        if resource.active_for_authentication?
          resource.create_score(resource.id, 101, 1, 100)
          sign_in(resource_name, resource)
          cookies['user_display_name'] = resource.display_name
          cookies['user_id'] = resource.id
          respond_with resource
        else
          expire_session_data_after_sign_in!
          respond_with resource
        end
      else
        valid_result = resource.errors.messages
        if valid_result.size > 0
          valid_result.each do |key, value|
            @messages << "#{key}"
          end
        end
      end
    else
      @messages << "false_captcha"
    end
  end

  def update
    self.resource = current_user if current_user
    valid_result = resource.errors.messages

    if params[resource_name][:recommended] == "1" && !params[resource_name][:recommended_name].blank?
      id = User.find_by_username(params[resource_name][:recommended_name])
      user = User.find_by_username(params[resource_name][:recommended_name])
      params[resource_name][:recommended_id] = user.id unless user.nil?
    end

    resource.update_attributes(params[resource_name])

    @messages = ""
    if valid_result.size != 0
      valid_result.each do |key, value|
        @messages << "*" + value[0] + '\n'
      end
      return @messages
    end
  end

  def username_check
    check = Regexp.new('(?!_)(?![0-9])^[-_a-zA-Z0-9\u4e00-\u9fa5]')
    if params[:user][:username] =~ check
      if User.exists?(:username => params[:user][:username])
        render :text => "false"
      else
        render :text => "true"
      end
    else
      render :text => "no"
    end
  end

  def email_check
    if User.exists?(:email => params[:user][:email])
      render :text => "false"
    else
      render :text => "true"
    end
  end

  def phone_check
    if User.exists?(:phone => params[:user][:phone])
      render :text => "false"
    else
      render :text => "true"
    end
  end

  protected

  def layout_by_resource
    if devise_controller? && resource_name == :user
      'home_manage'
    end
  end

  def reg_banner
    @banners = IBanner.page_name('登录/注册/找回密码').order("position ASC").all
  end

end