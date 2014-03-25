# encoding: utf-8
class DialogCelebrity::MasterDesignsController < ApplicationController
  def show
    @master_design = MasterDesign.find(params[:id])
    if params[:upload_id].present?
      @upload = MasterDesignUpload.find(params[:upload_id])
    else
      @upload = @master_design.master_design_uploads.order("created_at desc").first
    end
    @master = @master_design.master_profile
    @banners = IBanner.page_name('名人名家作品页').order("position ASC")
    @new_designs = IColumnData.where(i_column_type_id: 1).order("position asc").limit(5)
  end

  def download
    upload = MasterDesignUpload.find(params[:id])
    if upload
      send_file upload.file2.path(:slide)
    else
      render nothing: true, status: 404
    end
  end
end