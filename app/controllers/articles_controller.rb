class ArticlesController < ApplicationController
  before_filter :get_articles

  def index
    @weekly_tips = WeeklyTip.page(1)
  end

  def show
    @article = Post.find(params[:id])
    @prev_article = get_articles.where("published_at < ?", @article.published_at).first
    @next_article = get_articles.where("published_at > ?", @article.published_at).last
  end

  def get_articles
    articles = Subject.content("articles")
    @tags = articles.tag_counts_on(:tags)
    @articles = articles.page(params[:page]).per(5)
    @articles = @articles.tagged_with(params[:tags]) if params[:tags]
    articles
  end

end
