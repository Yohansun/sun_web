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

  def weekly_tips
    weekly_tips = Subject.content("weekly_tips")
  end

  def current_weekly_tip
    @current_weekly_tip ||= params[:id].nil? ? weekly_tips.first : WeeklyTip.find(params[:id])
  end

  def prev_weekly_tip
    @prev_weekly_tip ||= weekly_tips.where("published_at < ?", current_weekly_tip.published_at).first if current_weekly_tip
  end

  def next_weekly_tip
    @next_weekly_tip ||= weekly_tips.where("published_at > ?", current_weekly_tip.published_at).last if current_weekly_tip
  end

  def weeks_of_weekly_tips
    weeks = []
    if Subject.content("weekly_tips")
      Subject.content("weekly_tips").find_each do |week|
        weeks << week unless weeks.include? week
      end
    end
    weeks
  end

  def find_user
    @user = User.find(params[:user_id]) if params[:user_id]
  end

end
