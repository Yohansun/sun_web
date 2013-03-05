# -*- encoding : utf-8 -*-
class Users::SessionsController < Devise::SessionsController
  layout :layout_by_resource

  def create
    resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    resource.first_login_today(resource)
    respond_with resource, :location => after_sign_out_path_for(resource)
  end

  protected
  def layout_by_resource
    if devise_controller? && resource_name == :user
      'application'
    end
  end
end
