class ArticlesController < ApplicationController

  def index
    @articles = Subject.content("articles").order("published_at DESC").page(params[:page]).per(5)  if Subject.content("articles")
  end

  def show
    @article = Post.find(params[:id])
  end

end
