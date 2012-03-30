# -*- encoding : utf-8 -*-
module MagicContent
class MasterDesignsController < BaseController
    belongs_to :subject

    def create
      @master_design = parent.master_designs.new(rebuild_params(params[:master_design]))
      create! do |success, failure|
        failure.html { render :action => 'new' }
        success.html { redirect_to  subject_master_designs_path }
      end
    end

    def update
      params[:master_design] = rebuild_params(params[:master_design])
      update! do |success, failure|
        failure.html { render :action => 'edit' }
        success.html { redirect_to  subject_master_designs_path }
      end
    end
  end
end
