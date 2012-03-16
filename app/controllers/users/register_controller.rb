# -*- Encoding: UTF-8 -*-
class Users::RegisterController < Devise::RegistrationsController
  layout :layout_by_resource

  def create
    rebuild_params
    super
  end

  def rebuild_params
    if session[:role]
      params[:user][:role_id] = Role.find_by_role(session[:role]).id
    end

    if params[:user][:sex]
      case params[:user][:sex]
        when '1'
          params[:user][:sex] = '男'
        when '0'
          params[:user][:sex] = '女'
      end
    end

  end

  protected

  def layout_by_resource
    if devise_controller? && resource_name == :user
      'application'
    end
  end

  def after_sign_up_path_for(resource)
    users_suc_regist_path
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
