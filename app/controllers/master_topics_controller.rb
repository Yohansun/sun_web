class MasterTopicsController < ApplicationController
  before_filter :get_topics

  def show
    @topic = Post.find(params[:id])
    @prev_topic = get_topics.where("published_at < ?",@topic.published_at).first
    @next_topic = get_topics.where("published_at > ?",@topic.published_at).last
    @comments = @topic.comments.page params[:page]
  end

  def get_topics
    if topics = Subject.content("master_topics")
      @tags = topics.tag_counts_on(:tags)
      @topics = topics.page(params[:page]).per(5)
      @topics = @topics.tagged_with(params[:tags]) if params[:tags]
    end
    topics
  end

end
