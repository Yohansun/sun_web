# -*- encoding : utf-8 -*-
module MagicContent
  class MasterDesignsController < BaseController
    belongs_to :subject

    def create
      @master_design = parent.master_designs.new(rebuild_params(params[:master_design]))
      build_recommend_color(params[:master_design], params[:recommend_color])

      create! do |success, failure|
        failure.html { render :action => 'new' }
        success.html { redirect_to subject_master_designs_path }
      end
    end

    def update
      params[:master_design] = rebuild_params(params[:master_design])
      build_recommend_color(params[:master_design], params[:recommend_color])

      update! do |success, failure|
        failure.html { render :action => 'edit' }
        success.html { redirect_to subject_master_designs_path }
      end
    end

    def build_recommend_color(arg1, arg2)
      if arg1.include?("master_design_upload_ids")
        arg1[:master_design_upload_ids].each do |u|
          m = MasterDesignUpload.find(u.to_i)
          3.times do |i|
            m.attributes = ({ ("recommend_color" + (i+1).to_s).to_sym          => arg2[u.to_s]["recommend_color" + (i+1).to_s],
                              ("recommend_color_category" + (i+1).to_s).to_sym => arg2[u.to_s]["recommend_color_category" + (i+1).to_s] })
          end
          m.save
        end
      end
    end
  end
end