# -*- encoding : utf-8 -*-
module MagicContent
  class WeeklyStarsController < BaseController
    belongs_to :subject

    def create
      @weekly_star = parent.weekly_stars.new(rebuild_params(params[:weekly_star]))
      build_recommend_color(params[:weekly_star], params[:recommend_color])

      create! do |success, failure|
        failure.html { render :action => 'new' }
        success.html { redirect_to subject_weekly_stars_path }
      end
    end

    def update
      params[:weekly_star] = rebuild_params(params[:weekly_star])
      build_recommend_color(params[:weekly_star], params[:recommend_color])

      update! do |success, failure|
        failure.html { render :action => 'edit' }
        success.html { redirect_to subject_weekly_stars_path }
      end
    end

    def build_recommend_color(arg1, arg2)
      arg1[:weekly_star_upload_ids].each do |u|
        m = WeeklyStarUpload.find(u.to_i)
        3.times do |i|
          unless arg2[u.to_sym]["recommend_color" + (i+1).to_s].blank?
            m.attributes = ({ ("recommend_color" + (i+1).to_s).to_sym => arg2[u.to_s]["recommend_color" + (i+1).to_s],
                              ("recommend_color_category" + (i+1).to_s).to_sym => arg2[u.to_s]["recommend_color_category" + (i+1).to_s] })
          end
        end
        m.save
      end
    end
  end
end