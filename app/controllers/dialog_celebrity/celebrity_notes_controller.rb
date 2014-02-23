# encoding: utf-8
class DialogCelebrity::CelebrityNotesController < ApplicationController
  include CommonModule
  before_filter :get_page_data,:only => [:index,:show]
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
    @articles = @articles.order("updated_at desc").page(params[:page]).per(4)

    @banners = IBanner.page_name('名家手记').order("position ASC")

  end

  def show
    @article = CelebrityNote.find(params[:id])
    @banners = IBanner.page_name('名家手记').order("position ASC")
    @new_designs = MasterDesign.order("updated_at desc").limit(5)

    @banners = IBanner.page_name('名家手记').order("position ASC")
    @new_designs = MasterDesign.order("updated_at desc").limit(5)

    render "dialog_celebrity/editor_treasuries/show"
  end
end
