# encoding: utf-8
class Story < ActiveRecord::Base
  attr_accessible :title, :content, :area_id, :user_id, :property_name, :parent_id, :demand, :budget

  has_one :story_image, :dependent => :destroy
  has_many :votes, :as => :voteable
  has_many :collects, :dependent => :destroy
  has_many :comments, :as => :commentable
  has_many :designs
  belongs_to :area
  belongs_to :user
  has_one :baicheng_event
  
  has_many :story_comments, :dependent => :destroy
  has_many :stroy_users
  has_many :want_designers, :through => :stroy_users, :source => :user #想设计的设计师
  # has_many :tags, class_name: 'StoryImageTag', :foreign_key => 'story_image_id',:dependent => :destroy

  after_create :sync_baicheng_event

  def cover_img
  	self.story_images.where(is_cover: 1).try(:first)
  end

  def comments_count
    self.comments.size
  end

  def location
    if self.area_id && self.area_id != 0
      area = Area.find(area_id)
      if area.parent.name == area.parent.parent.name
        area.parent.name + " " + area.name
      else
        area.parent.parent.name + " " + area.parent.name + " " + area.name
      end
    end
  end

  def sync_baicheng_event
    BaichengEvent.create(eventable_id: self.id, eventable_type: Story.name, area_id: self.area_id)
  end
end
