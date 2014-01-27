#encoding: utf-8
class Manage::DialogCelebrities::EditorTreasuriesController < Manage::BaseController
  def index
    @collection = collection
    if params[:query]
      @collection = @collection.where("celebrity_content_board_id = ? and name LIKE ?", params[:board_id],"%#{params[:key]}%")
    end
  end

  def edit
    @resource = resource
  end

  def new
    @resource = EditorTreasury.new
  end

  def create
    create!(:notice => "保存成功!") {
      if resource.errors.full_messages.count > 0
        flash[:alert] = resource.errors.full_messages.join(" and ")
        @resource = EditorTreasury.new(params[:editor_treasury])
        return render :new
      else
        dialog_celebrities_editor_treasuries_path
      end
    }
  end

  def update
    update!(:notice => "保存成功!") {
      if resource.errors.full_messages.count > 0
        flash[:alert] = resource.errors.full_messages.join(" and ")
        return redirect_to edit_dialog_celebrities_editor_treasury_path(resource)
      else
        dialog_celebrities_editor_treasuries_path
      end
    }
  end

  def destroy
    destroy!(:notice => "删除成功!") {
      dialog_celebrities_editor_treasuries_path
    }
  end
end