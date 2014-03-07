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

  def update_image
    HomeDialogCelebrityImage.find(params[:id]).update_attributes title: params[:title],
      position: params[:position], url: params[:url]
    render :js => "alert('保存成功')"
  end

  def create_image
    return render :json => params
    image = HomeDialogCelebrityImage.find(params[:image_id])
    if image && params[:file].present?
      @page.edit_treasury_thumb = params[:file]
      if @page.save
        render :json => {:notify => "上传成功",:url => @page.edit_treasury_thumb(:thumb)}, :layout => false
      else
        return render :json => {:notify => "保存失败"}, :layout => false
      end
    else
      return render :json => {:notify => "没有数据"}, :layout => false
    end
  end

  private
  def find_page
    @page = HomeDialogCelebrity.first
  end
end
