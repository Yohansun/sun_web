#encoding: utf-8
class Manage::HomeDialogCelebritiesController < Manage::BaseController
  before_filter :find_page
  def index
    @masters = MasterProfile.where(mtype: 0)
    @celebrities = MasterProfile.where(mtype: 1)
  end

  def images
    @images = @page.images
  end

  def save_data
    @page.last_celebrity = false
    @page.last_master = false
    if @page.update_attributes params[:dialog_celebrity_page]
      render :json => {:notify => "对话名人首页全部保存成功",:code => 1 }
    else
      render :json => {:notify => "保存出错请于管理员联系" }
    end
  end

  private
  def find_page
    @page = HomeDialogCelebrity.first
  end
end
