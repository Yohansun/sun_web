class ArticlesController < ApplicationController
  before_filter :get_articles_with_tags

  def show
    @article = Post.find(params[:id])
  end

  def get_articles_with_tags
    @tags = Subject.content("articles").tag_counts_on(:tags)
    @articles = Subject.content("articles").order("published_at DESC").page(params[:page]).per(5) if Subject.content("articles")
    if params[:tags]
      @articles = @articles.tagged_with(params[:tags])
    end
  end

end
