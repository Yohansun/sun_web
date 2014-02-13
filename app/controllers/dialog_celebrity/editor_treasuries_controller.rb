class DialogCelebrity::EditorTreasuriesController < ApplicationController
  def index
    if params[:keyword].present?
      if params[:board_id].present?
        @articles = EditorTreasury.where("celebrity_content_board_id = ? and name like ?", params[:board_id],"%#{params[:keyword]}%")
      else
        @articles = EditorTreasury.where("name like ?","%#{params[:keyword]}%")
      end
    else
      if params[:board_id].present?
        @articles = EditorTreasury.where(:celebrity_content_board_id => params[:board_id])
      else
        @articles = EditorTreasury
      end
    end
    @articles = @articles.order("id desc").page(params[:page]).per(4)
  end

  def show
    @article = EditorTreasury.find(params[:id])
  end
end
