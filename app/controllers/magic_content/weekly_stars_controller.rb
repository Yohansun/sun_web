# -*- encoding : utf-8 -*-
module MagicContent
  class WeeklyStarsController < BaseController
    belongs_to :subject

    def create
      @weekly_star = parent.weekly_stars.new(rebuild_params(params[:weekly_star]))
      build_recommend_color(params[:weekly_star], params[:recommend_color])

      set_sorts_for_design_image(params[:weekly_star][:design_link])
      create! do |success, failure|
        failure.html { render :action => 'new' }
        success.html { redirect_to subject_weekly_stars_path }
      end
    end

    def update
      params[:weekly_star] = rebuild_params(params[:weekly_star])
      build_recommend_color(params[:weekly_star], params[:recommend_color])

      set_sorts_for_design_image(params[:weekly_star][:design_link])
      update! do |success, failure|
        failure.html { render :action => 'edit' }
        success.html { redirect_to subject_weekly_stars_path }
      end
    end

    def build_recommend_color(arg1, arg2)
      if arg1.include?("weekly_star_upload_ids")
        arg1[:weekly_star_upload_ids].each do |u|
          m = WeeklyStarUpload.find(u.to_i)
          3.times do |i|
            m.attributes = ({ ("recommend_color" + (i+1).to_s).to_sym          => arg2[u.to_s]["recommend_color" + (i+1).to_s],
                              ("recommend_color_category" + (i+1).to_s).to_sym => arg2[u.to_s]["recommend_color_category" + (i+1).to_s] })
          end
          m.save
        end
      end
    end

    private
    def set_sorts_for_design_image(design_link)
      return unless design_link
      design_id = design_link.split('/').last
      if design = Design.find(design_id)
        design.design_images.each do |img|
          img.update_attribute(:sorts, 2)
        end
      end
    end
  end
end
