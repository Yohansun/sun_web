# -*- encoding : utf-8 -*-
module MagicContent
  class WeeklyStarsController < BaseController
    belongs_to :subject

    def create
      @weekly_star = parent.weekly_stars.new(rebuild_params(params[:weekly_star]))
      create! do |success, failure|
        failure.html { render :action => 'new' }
        success.html { redirect_to subject_weekly_stars_path }
      end
    end

    def update
      params[:weekly_star] = rebuild_params(params[:weekly_star])
      update! do |success, failure|
        failure.html { render :action => 'edit' }
        success.html { redirect_to subject_weekly_stars_path }
      end
    end
  end
end