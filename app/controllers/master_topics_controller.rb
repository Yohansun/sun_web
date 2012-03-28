class MasterTopicsController < ApplicationController
  before_filter :get_topics_with_tags

  def show
    @topic = Post.find(params[:id])
    @prev_topic = Subject.content("master topics").order("published_at DESC").where("published_at < ?",@topic.published_at).first
    @next_topic = Subject.content("master topics").order("published_at DESC").where("published_at > ?",@topic.published_at).last
  end

  def get_topics_with_tags
    @tags = Subject.content("master topics").tag_counts_on(:tags)
    @topics = Subject.content("master topics").order("published_at DESC").page(params[:page]).per(5) if Subject.content("master topics")
    if params[:tags]
      @topics = @topics.tagged_with(params[:tags])
    end
  end

end
