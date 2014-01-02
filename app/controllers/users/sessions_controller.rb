# -*- encoding : utf-8 -*-
class Users::SessionsController < Devise::SessionsController
  layout :layout_by_resource

  def create
    resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)

    cookies['user_display_name'] = resource.display_name
    cookies['user_id'] = resource.id

    resource.first_login_today(resource)
    respond_with resource, :location => after_sign_out_path_for(resource)
  end

  def destroy
    cookies['user_display_name'] = nil
    cookies['user_id'] = nil

    redirect_path = after_sign_out_path_for(resource_name)
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message :notice, :signed_out if signed_out

    # We actually need to hardcode this as Rails default responder doesn't
    # support returning empty response on GET request
    respond_to do |format|
      format.any(*navigational_formats) { redirect_to redirect_path }
      format.all do
        method = "to_#{request_format}"
        text = {}.respond_to?(method) ? {}.send(method) : ""
        render :text => text, :status => :ok
      end
    end
  end

  protected
  def layout_by_resource
    if devise_controller? && resource_name == :user
      'home_manage'
    end
  end
end
