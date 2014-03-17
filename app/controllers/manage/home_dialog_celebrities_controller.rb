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
    image = HomeDialogCelebrityImage.find(params[:id])
    ori_position = image.position.to_i
    position = params[:position].to_i
    ori_images = HomeDialogCelebrityImage.where(:position => position)
    image.update_attributes title: params[:title],
      position: position, url: params[:url]

    ori_images.each do |_image|
      next if _image.id == image.id
      _image.update_attributes :position => ori_position
    end
    render :json => { :position => position, :ori_position => ori_position  }
  end

  def create_image
    image = @page.images[params[:image_index].to_i-1]
    if image && params[:file].present?
      image.thumb = params[:file]
      if image.save
        render :json => {:notify => "上传成功",:url => image.thumb(:thumb)}, :layout => false
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
