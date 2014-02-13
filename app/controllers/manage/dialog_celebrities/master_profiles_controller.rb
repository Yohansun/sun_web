#encoding: utf-8
class Manage::DialogCelebrities::MasterProfilesController < Manage::BaseController
  def index
    @collection = collection.unscoped
    if params[:query]
      mtype = params[:mtype]
      board_id = params[:board_id]
      name = params[:name]
      if mtype.present?
        @collection = @collection.where(:mtype => mtype.to_i)
      end
      if board_id.present?
        @collection = @collection.where(:celebrity_content_board_id => board_id.to_i)
      end
      if name.present?
        @collection = @collection.where("name LIKE ?", "%#{name}%")
      end
    end
    @collection = @collection.order("updated_at desc").page(params[:page]).per(8)
  end

  def edit
    @resource = resource
  end

  def new
    @resource = MasterProfile.new
  end

  def create
    create!(:notice => "保存成功!") {
      if resource.errors.full_messages.count > 0
        flash[:alert] = resource.errors.full_messages.join(" and ")
        @resource = MasterProfile.new(params[:editor_treasury])
        return redirect_to params[:ref]
      else
        if params[:after_save] == "next"
          edit_dialog_celebrities_master_profile_path(resource,:step => params[:step].to_i+1)
        else
          dialog_celebrities_master_profiles_path
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
          edit_dialog_celebrities_master_profile_path(resource,:step => params[:step].to_i+1)
        else
          dialog_celebrities_master_profiles_path
        end
      end
    }
  end

  def destroy
    destroy!(:notice => "删除成功!") {
      dialog_celebrities_master_profiles_path
    }
  end

  def destroy_all
    MasterProfile.where("id in (?)",params[:ids].split(",").map(&:to_i)).each do |master_profile|
      if params[:type] == "0"
        master_profile.master_designs.destroy_all if master_profile.master_designs
        master_profile.notes.destroy_all if master_profile.notes
      end
      master_profile.destroy
    end
    return render :json => { :code => 1, :notify => "删除成功"  }
  end
end
