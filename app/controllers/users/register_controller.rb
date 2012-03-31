# -*- Encoding: UTF-8 -*-
class Users::RegisterController < Devise::RegistrationsController
  layout :layout_by_resource

  def create
    @messages = ""
    session_role

    if session[:user_role]
      params[resource_name][:role_id]    = Role.find_by_role(session[:user_role]).id
      params[resource_name][:des_status] = session[:des_status]
    end

    build_resource
    valid_result = resource.errors.messages

    if resource.save
      if resource.active_for_authentication?
        sign_in(resource_name, resource)
        respond_with resource
      else
        expire_session_data_after_sign_in!
        respond_with resource
      end
    else
      if valid_result.size > 0
        valid_result.each do |key, value|
          @messages << "*" + value[0] + '\n'
        end
        return @messages
      end
    end
  end

  def update
    self.resource = current_user if current_user
    valid_result = resource.errors.messages

    if params[resource_name][:sex]
      case params[resource_name][:sex]
        when '1'
          params[resource_name][:sex] = '男'
        when '0'
          params[resource_name][:sex] = '女'
      end
    end

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

  def session_role
    unless params[:user][:user_role].blank?
      r                   = params[:user][:user_role].split("_")
      session[:user_role] = r[0]
      if r.size == 2
        if r[1] == "1"
          session[:des_status] = true
        else
          session[:des_status] = false
        end
      end
    end
  end

  protected

  def layout_by_resource
    if devise_controller? && resource_name == :user
      'application'
    end
  end
end

#def search_area(state_id,city_id,district_id)
#  area = []
#  File.open("#{Rails.root}/lib/data/areas.json", 'r') do |file|
#      content = file.readlines.to_s.delete('\\').delete('n')
#      hash = JSON.parse(content)
#  end
#
#end