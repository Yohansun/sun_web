# -*- encoding : utf-8 -*-
require 'open-uri'

class Design < ActiveRecord::Base
  acts_as_taggable

  attr_accessible :city, :content, :room_type, :style, :title, :design_image_ids,
    :tag_list, :area_id, :reason, :user_id, :view_count, :recommended, :design_color, :recommend_color_category1
  validates_presence_of :title, :content

  belongs_to :user
  has_many :comments, :as => :commentable
  has_many :votes, :as => :voteable
  has_many :design_images, :as => :imageable

  paginates_per 8

  def cover_img
    self.design_images.order("is_cover DESC").first
  end

  def comments_count
    self.comments.size
  end

  def self.load_old_data
    OldDesign.all.each do |old|
      user = User.find_by_old_id(old.user_id)
      next unless user
      tags = old.tags.gsub('，', ',') if old.tags
      design = Design.create(user_id: user.id, title: old.title, content: old.title, view_count: old.view_count,
        style: old.style, recommended: old.recommended, tag_list: tags)
      p design
      OldDesignFile.where(:old_design_id => old.id).all.each do |file|
        image = DesignImage.new
        image.user_id = user.id
        image.imageable = design
        image.is_cover = file.is_cover
        handle = open(file.src) rescue nil
        next unless image.file
        handle.class.class_eval { attr_accessor :original_filename, :content_type }
        handle.original_filename = file.src.split("/").last
        image.file = handle

        image.save
      end
    end
  end
end