#encoding: utf-8
class Manage::DialogCelebrities::CelebrityNotesController < Manage::BaseController
  def index
    @collection = collection
    if params[:query]
      board_id = params[:board_id]
      name = params[:key]
      if params[:master_id].present?
        masters = MasterProfile.where(:id => params[:master_id])
      elsif params[:match].present?
        masters = MasterProfile.where("name = ? and mtype = ?","params[:master_name]",params[:mtype])
      else
        masters = MasterProfile.where("name LIKE ? and mtype = ?","%#{params[:master_name]}%",params[:mtype])
      end
      if board_id.present?
        @collection = @collection.where(:celebrity_content_board_id => board_id.to_i)
      end
      if name.present?
        @collection = @collection.where("name LIKE ?", "%#{name}%")
      end
      if masters.count > 0
        master_ids = masters.map(&:id)
        @collection = @collection.where("master_profile_id in (?)",master_ids)
      end
    end
    @collection = @collection.desc(:updated_at).page(params[:page]).per(8)
  end

  def edit
    @resource = resource
  end

  def new
    @resource = CelebrityNote.new
  end

  def create
    create!(:notice => "保存成功!") {
      if resource.errors.full_messages.count > 0
        flash[:alert] = resource.errors.full_messages.join(" and ")
        @resource = CelebrityNote.new(params[:celebrity_note])
        return render :new
      else
        dialog_celebrities_celebrity_notes_path
      end
    }
  end

  def update
    update!(:notice => "保存成功!") {
      if resource.errors.full_messages.count > 0
        flash[:alert] = resource.errors.full_messages.join(" and ")
        return redirect_to edit_dialog_celebrities_celebrity_note_path(resource)
      else
        dialog_celebrities_celebrity_notes_path
      end
    }
  end

  def destroy
    destroy!(:notice => "删除成功!") {
      dialog_celebrities_celebrity_notes_path
    }
  end
end
