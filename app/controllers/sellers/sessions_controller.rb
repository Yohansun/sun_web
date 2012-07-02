# -*- encoding : utf-8 -*-
class Sellers::SessionsController < Devise::SessionsController
  layout :layout_by_resource

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.class == SellerUser
      seller_user_seller_data_path
    else
      seller_user_session_path
    end
  end

  protected
  def layout_by_resource
    if devise_controller? && resource_name == :seller_user
      'sellers'
    end
  end
end