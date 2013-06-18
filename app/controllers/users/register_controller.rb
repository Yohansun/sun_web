#encoding: utf-8

# -*- Encoding: UTF-8 -*-
class Users::RegisterController < Devise::RegistrationsController
  layout :layout_by_resource

  def create
    @messages = ""

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
        respond_with resource
      else
        expire_session_data_after_sign_in!
        respond_with resource
      end
    else
      valid_result = resource.errors.messages
      if valid_result.size > 0
        valid_result.each do |_, value|
          @messages << "*" + value[0] + '\n'
        end
      end
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
        render :text => "该用户名已经被注册，请输入新的用户名！"
      else
        render :text => "恭喜您，该用户名尚未被注册！"
      end
    else
      render :text => "用户名不能为空，只能用数字、字母、下划线和汉字组成，不能包含空格，并且不能以下划线和数字开头！"
    end
  end

  protected

  def layout_by_resource
    if devise_controller? && resource_name == :user
      'application'
    end
  end
end