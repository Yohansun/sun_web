class MasterInterviewsController < ApplicationController
  def index
    @articles = Subject.content("master_profile").page(params[:page]).per(5)
    @articles = @articles.tagged_with(params[:tags]) if params[:tags]
    @articles = @articles.where(:master_kind => params[:master_kind]) if params[:master_kind]
  end

  def show
    @article = MasterProfile.find(params[:id])
  end
end
