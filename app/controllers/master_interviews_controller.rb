class MasterInterviewsController < ApplicationController
  def index
    @articles = Subject.content("master_profile").page(params[:page]).per(5)
    if params[:filter]
      @articles = @articles.tagged_with(params[:filter])
    end
  end

  def show
    @article = MasterProfile.find(params[:id])
  end
end
