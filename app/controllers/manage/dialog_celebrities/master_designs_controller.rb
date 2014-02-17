#encoding: utf-8
class Manage::DialogCelebrities::MasterDesignsController < Manage::BaseController
  def index
    @collection = collection
    if params[:query]
      if params[:master_id].present?
        masters = MasterProfile.where(:id => params[:master_id])
      elsif params[:match].present?
        masters = MasterProfile.where("name = ? and mtype = ?","params[:master_name]",params[:mtype])
      else
        masters = MasterProfile.where("name LIKE ? and mtype = ?","%#{params[:master_name]}%",params[:mtype])
      end
      if masters.count > 0
        master_ids = masters.map(&:id)
        if params[:design_name].present?
          @collection = @collection.where("design_name LIKE ? and master_profile_id in (?)","%#{params[:design_name]}%",master_ids)
        else
          @collection = @collection.where("master_profile_id in (?)",master_ids)
        end
      else
        if params[:design_name].present?
          @collection.where("design_name LIKE ?","%#{params[:design_name]}%")
        end
      end
    end
    @collection = @collection.page(params[:page]).per(4)
  end

  def edit
    @resource = resource
  end

  def new
    @resource = MasterDesign.new
  end

  def create
    create!(:notice => "保存成功!") {
      if resource.errors.full_messages.count > 0
        flash[:alert] = resource.errors.full_messages.join(" and ")
        @resource = MasterDesign.new(params[:master_design])
        return redirect_to params[:ref]
      else
        master = MasterProfile.find(params[:master_design][:master_profile_id])
        resource.update_attributes :master_name => master.name
        if params[:after_save] == "next"
          dialog_celebrities_master_design_uploads_path(master_design_id: resource.id)
        else
          dialog_celebrities_master_designs_path
        end
      end
    }
  end

  def update
    update!(:notice => "保存成功!") {
      if resource.errors.full_messages.count > 0
        flash[:alert] = resource.errors.full_messages.join(" and ")
        return redirect_to params[:ref]
        # return redirect_to edit_dialog_celebrities_master_profile_path(resource)
      else
        if params[:after_save] == "next"
          dialog_celebrities_master_design_uploads_path(master_design_id: resource.id)
        else
          dialog_celebrities_master_designs_path
        end
      end
    }
  end

  def destroy
    destroy!(:notice => "删除成功!") {
      dialog_celebrities_master_profiles_path
    }
  end

  def delete
    MasterDesign.find(params[:id]).destroy
    render :text => "succ"
  end

end
