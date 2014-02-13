class DialogCelebrity::MasterProfilesController < ApplicationController
  def celebrities
    @celebrities = MasterProfile.where(mtype: 1).order("id desc")
  end

  def maste_interviews
    @masters = MasterProfile.where(mtype: 0)
    if params[:board_id].present?
      @masters = @masters.where(:celebrity_content_board_id => params[:board_id].to_i)
    end
    @masters = @masters.order("id desc").page(params[:page]).per(8)
  end

  def master_interview
    @master = MasterProfile.find(params[:id])
  end

end
