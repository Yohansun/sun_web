class WeeklyTipsController < ApplicationController
  def index
    @weekly_tips = WeeklyTip.page(params[:page])
  end
end