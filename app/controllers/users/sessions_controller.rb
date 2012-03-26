# -*- encoding : utf-8 -*-
class Users::SessionsController < Devise::SessionsController
  layout :layout_by_resource

  protected
  def layout_by_resource
    if devise_controller? && resource_name == :user
      'application'
    end
  end
end
