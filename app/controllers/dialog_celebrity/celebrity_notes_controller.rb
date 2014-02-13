class DialogCelebrity::CelebrityNotesController < ApplicationController
  def index
    if params[:keyword].present?
      if params[:board_id].present?
        @articles = CelebrityNote.where("celebrity_content_board_id = ? and name like ?", params[:board_id],"%#{params[:keyword]}%")
      else
        @articles = CelebrityNote.where("name like ?","%#{params[:keyword]}%")
      end
    else
      if params[:board_id].present?
        @articles = CelebrityNote.where(:celebrity_content_board_id => params[:board_id])
      else
        @articles = CelebrityNote
      end
    end
    @articles = @articles.order("id desc").page(params[:page]).per(4)
  end

  def show
    @article = CelebrityNote.find(params[:id])
    render "dialog_celebrity/editor_treasuries/show"
  end
end
