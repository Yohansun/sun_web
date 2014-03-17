# encoding: utf-8
class DialogCelebrity::EditorTreasuriesController < ApplicationController
  include CommonModule
  before_filter :get_page_data,:only => [:index,:show]
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
    @articles = @articles.order("updated_at desc").page(params[:page]).per(4)
    @banners = IBanner.page_name('小编宝典').order("position ASC")
  end

  def show
    @article = EditorTreasury.find(params[:id])
    @banners = IBanner.page_name('小编宝典').order("position ASC")
    @new_designs = IColumnData.where(i_column_type_id: 1).order("position asc").limit(5)
  end
end
