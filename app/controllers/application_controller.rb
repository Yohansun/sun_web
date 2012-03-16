class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.class == User
      #root_path
      users_suc_designer_path
    end
  end

  def after_sign_up_path_for(resource)
    users_suc_designer_path
  end
end
