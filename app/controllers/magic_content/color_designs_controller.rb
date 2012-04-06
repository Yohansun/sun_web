# -*- encoding : utf-8 -*-
module MagicContent
  class ColorDesignsController < BaseController
    belongs_to :subject

    def create
      @color_design = parent.color_designs.new(rebuild_params(params[:color_design]))
      create! do |success, failure|
        failure.html { render :action => 'new' }
        success.html { redirect_to subject_color_designs_path }
      end
    end

    def update
      params[:color_design] = rebuild_params(params[:color_design])
      update! do |success, failure|
        failure.html { render :action => 'edit' }
        success.html { redirect_to subject_color_designs_path }
      end
    end
  end
end
