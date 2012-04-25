class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :search_color_code

  def stored_location_for(resource)
    if current_user && current_user.not_role?
      flash[:notice] = "Congratulations, you're signed up!"
      return omniauth_user_user_path(resource)
    end
    super(resource)
  end

  def find_user
    @user = User.find(params[:user_id]) if params[:user_id]
  end

  def search_color_code(arg)
    ColorCode.find_by_code(arg)
  end
end