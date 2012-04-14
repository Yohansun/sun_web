class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_weekly_tip, :prev_weekly_tip, :next_weekly_tip, :weeks_of_weekly_tips

  def stored_location_for(resource)
    if current_user && current_user.not_role?
      flash[:notice] = "Congratulations, you're signed up!"
      return omniauth_user_user_path(resource)
    end
    super( resource )
  end

  def find_user
    @user = User.find(params[:user_id]) if params[:user_id]
  end

end
