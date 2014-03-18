# -*- encoding : utf-8 -*-
class DialogCelebrity::HomeController < ApplicationController
  include CommonModule
  before_filter :get_page_data,:only => [:index]
  def index
    @page = DialogCelebrityPage.first
    if @page.present?
      if @page.master_id.present?
        @master = @page.last_master ? MasterProfile.unscoped.where(mtype: 0).last : MasterProfile.find(@page.master_id)
      end
      if @page.celebrity_id.present?
        @celebrity = @page.last_celebrity ? MasterProfile.unscoped.where(mtype: 1).last : MasterProfile.find(@page.celebrity_id)
      end
    end
    #@wonderfuls = IColumnData.show_data(16).limit(5)
    @banners = IBanner.page_name("对话名人首页").order("position asc")
  end

  def celebrity_questions
    @questions = CelebrityQuestion.where(:celebrity_content_id => params[:celebrity_content_id]).page(params[:page]).per(10)
    render :json => { :content => rander_to_string("celebrity_questions") }
  end
end
