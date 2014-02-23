# -*- encoding : utf-8 -*-
class DialogCelebrity::HomeController < ApplicationController
  def index
    @page = DialogCelebrityPage.first
    @master = @page.last_master ? MasterProfile.unscoped.where(mtype: 0).last : MasterProfile.find(@page.master_id)
    @celebrity = @page.last_celebrity ? MasterProfile.unscoped.where(mtype: 1).last : MasterProfile.find(@page.celebrity_id)
    @wonderfuls = IColumnData.show_data(16).limit(5)
    @i_banner = IBanner.page_name("对话名人首页")
  end

  def celebrity_questions
    @questions = CelebrityQuestion.where(:celebrity_content_id => params[:celebrity_content_id]).page(params[:page]).per(10)
    render :json => { :content => rander_to_string("celebrity_questions") }
  end
end
