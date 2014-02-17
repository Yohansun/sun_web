class DialogCelebrity::MasterDesignsController < ApplicationController
  def show
    @master_design = MasterDesign.find(params[:id])
  end

  def download
    upload = MasterDesignUpload.find(params[:id])
    if upload
      send_file upload.file.path(:slide)
    else
      render nothing: true, status: 404
    end
  end

end
