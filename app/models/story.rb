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
  
  # has_many :story_comments, :dependent => :destroy #如果这句用不着,就删了吧
  has_many :story_users
  has_many :want_designers, :through => :story_users, :source => :user #想设计的设计师
  # has_many :tags, class_name: 'StoryImageTag', :foreign_key => 'story_image_id',:dependent => :destroy

  belongs_to :design
 
  after_update :sync_baicheng_event

  scope :has_uploaded,->{joins(:story_image).where('not story_images.id is null')}
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
  
  
  
  def city_name
    if self.area_id && self.area_id != 0
      area = Area.find(area_id)
      return area.parent.name
    end
  end

  def sync_baicheng_event
    if self.is_save.present? && self.is_save == true
      name = self.user.name.present? ? self.user.name : self.user.username
      SysMsg.send_to(self.user,"您已成功发表了 #{name}的房型图。",
        {:reply_type => "baicheng",:re_url =>"/love/stories/#{self.id}"})
    end
  end
end
