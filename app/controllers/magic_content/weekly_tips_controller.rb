# -*- encoding : utf-8 -*-
module MagicContent
  class WeeklyTipsController < BaseController
    belongs_to :subject

    def create
      @weekly_tip = parent.weekly_tips.new(rebuild_params(params[:weekly_tip]))
      create! do |success, failure|
        failure.html { render :action => 'new' }
        success.html { redirect_to  subject_weekly_tips_path }
      end
    end

    def update
      params[:weekly_tip] = rebuild_params(params[:weekly_tip])
      update! do |success, failure|
        failure.html { render :action => 'edit' }
        success.html { redirect_to  subject_weekly_tips_path }
      end
    end
  end
end