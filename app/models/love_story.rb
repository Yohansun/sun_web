# encoding: utf-8
class LoveStory < ActiveRecord::Base
  attr_accessible :area_id, :come_from, :content, :user_name, :user_id

  belongs_to :user
  has_many :love_story_images,:dependent => :destroy
end
