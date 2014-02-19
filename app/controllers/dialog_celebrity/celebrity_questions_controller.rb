class DialogCelebrity::CelebrityQuestionsController < ApplicationController
  before_filter :authenticate_user!,only: [:new]
  def index
  end

  def new
  end

  def create
    question = CelebrityQuestion.new params[:celebrity_question]
    unless question.save
      flash[:notice] = question.errors.full_messages.join("\n")
      redirect_to new_dialog_celebrity_celebrity_question_path
    else
      redirect_to dialog_celebrity_celebrity_questions_path
    end
  end

  def refresh_questions
    @board_id = params[:board_id]
    if params[:keyword].present?
      if @board_id
        @questions = CelebrityQuestion.where("celebrity_content_board_id = ? and name like ?",@board_id.to_i,"%#{params[:keyword]}%").order("updated_at desc")
      else
        @questions = CelebrityQuestion.where("name like ?","%#{params[:keyword]}%").order("updated_at desc")
      end
    elsif params[:key].present?
      if params[:board_id].present?
        @questions = CelebrityQuestion.where(celebrity_content_board_id: params[:board_id],key: params[:key]).order("updated_at desc")
      else
        @questions = CelebrityQuestion.where(key: params[:key]).order("updated_at desc")
      end
    else
      if params[:board_id].present?
        @questions = CelebrityQuestion.where(celebrity_content_board_id: params[:board_id]).order("updated_at desc")
      else
        @questions = CelebrityQuestion.order("updated_at desc")
      end
    end
    if @board_id.present?
      @board = CelebrityContentBoard.find(@board_id)
    end
    @questions = @questions.page(params[:page]).per(10)
    @replied_count = sprintf "%010.0f",CelebrityQuestion.replied_count(params[:board_id])
    @content = render_to_string( partial: "dialog_celebrity/shared/questions" )
    respond_to do |format|
      format.js
    end
  end
end
