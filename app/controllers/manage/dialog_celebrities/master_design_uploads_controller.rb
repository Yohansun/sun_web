#encoding: utf-8
class Manage::DialogCelebrities::MasterDesignUploadsController < Manage::BaseController
  def index
    @uploads = MasterDesignUpload.where(:master_design_id => params[:master_design_id].to_i).order("created_at desc")
  end

  def create_file
    if params[:file2].present?
      upload = MasterDesignUpload.new
      upload.file2 = params[:file2]
      upload.master_design_id = params[:master_design_id]
      if upload.save
        content = render_to_string(:partial => "manage/dialog_celebrities/master_design_uploads/upload",:locals => { upload: upload })
        render :json => {:notify => "上传成功",:content => content}, :layout => false
      else
        return render :json => {:notify => "保存失败"}, :layout => false
      end
    else
      return render :json => {:notify => "没有数据"}, :layout => false
    end
  end

  def save_all
    cover_upload_id = params[:cover_upload_id]
    data = params[:data]
    data.each_pair do |index,_data|
      upload = MasterDesignUpload.find(_data[:id])
      upload.is_cover = false
      if cover_upload_id == upload.id.to_s
        upload.is_cover = true
      end
      upload.update_attributes(_data)
    end
    render :text => "succ"
  end

  def delete
    MasterDesignUpload.find(params[:id]).destroy
    render :text => "succ"
  end

  def edit
  end
end
