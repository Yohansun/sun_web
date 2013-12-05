class ArticlesController < ApplicationController
  layout "home_manage"
  before_filter :get_articles

  caches_action :index, :expires_in => 7.days
  caches_action :show, :expires_in => 7.days

  def index
    @weekly_tips = WeeklyTip.page(1)

    expires_in 60.minutes, 'max-stale' => 2.hours, :public => true
  end

  def show
     @article = Post.find(params[:id])
     tags=@article.tag_counts_on(:tags)
     if tags.present?
     @prev_article = get_articles.tagged_with(tags).where("published_at < ?", @article.published_at).first
     @next_article = get_articles.tagged_with(tags).where("published_at > ?", @article.published_at).last
     else
      @prev_article = get_articles.where("published_at < ?", @article.published_at).first
      @next_article = get_articles.where("published_at > ?", @article.published_at).last
     end

     expires_in 60.minutes, 'max-stale' => 2.hours, :public => true
  end

  def get_articles
    articles = Subject.content("articles")
    @tags = articles.tag_counts_on(:tags)
    @articles = articles.page(params[:page]).per(5)
    @articles = @articles.tagged_with(params[:tags]) if params[:tags]
    articles
  end

end