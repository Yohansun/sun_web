require 'open-uri'

include ActionView::Helpers::SanitizeHelper

class OldArticle < ActiveRecord::Base
  attr_accessible :class_id, :content, :image, :publish_at, :thumb, :title, :view_count

  def self.migrate_to_new
    OldArticle.all.each do |old|
      intro = strip_tags(old.content).truncate 150
      article = Post.new(title: old.title, intro: intro, body: old.content,
        subject_id: 2, published_at: old.publish_at)
      article.preview_img = open(old.image) if old.image
      article.body = article.body.gsub("http://www.icolor.com.cn",
        "http://www.icolor.com.cn:8090")
      article.save
      p article.id
    end
  end
end