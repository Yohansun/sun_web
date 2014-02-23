class DialogCelebrity::MasterDesignsController < ApplicationController
  def show
    @master_design = MasterDesign.find(params[:id])
    @upload = MasterDesignUpload.find(params[:upload_id])
    @master = @master_design.master_profile
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
