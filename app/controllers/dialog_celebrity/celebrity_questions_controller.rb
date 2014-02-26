# encoding: utf-8
class DialogCelebrity::CelebrityQuestionsController < ApplicationController
  include CommonModule
  before_filter :authenticate_user!,only: [:new]
  before_filter :get_page_data,:only => [:index,:new]
  skip_before_filter :verify_authenticity_token, only: [:create,:upload_image]
  def index
    @banners = IBanner.page_name('名人问答').order("position ASC")
    @new_designs = MasterDesign.order("updated_at desc").limit(5)
  end

  def new
    @banners = IBanner.page_name('名人问答提问页').order("position ASC")
  end

  def create
    question = CelebrityQuestion.new params[:celebrity_question]
    question.key = ""
    unless question.save
      flash[:notice] = question.errors.full_messages.join("\n")
      redirect_to new_dialog_celebrity_celebrity_question_path
    else
      image_ids = params[:images].split("|")
      image_ids.each do |image_id|
        image = CelebrityQuestionImage.find(image_id)
        image.resource = question
        image.save
      end
      redirect_to dialog_celebrity_celebrity_questions_path
    end
  end

  def refresh_questions
    @board_id = params[:board_id]
    @keyword = params[:keyword]
    if @keyword.present?
      if @board_id
        @questions = CelebrityQuestion.where("celebrity_content_board_id = ? and name like ?",@board_id.to_i,"%#{@keyword}%").order("updated_at desc")
      else
        @questions = CelebrityQuestion.where("name like ?","%#{@keyword}%").order("updated_at desc")
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

  def upload_image
    image = CelebrityQuestionImage.new
    image.image = params[:Filedata]
    if image.save
      render :text => "#{image.id}|#{image.image(:thumb)}|#{image.image(:upload_prew)}"
    else
      return render :text => "0"
    end
  end
end
