class StoryComment < ActiveRecord::Base
  attr_accessible :user_id, :story_id, :content

  belongs_to :user
  belongs_to :story
  has_many :re_s, class_name: 'ReStory', :dependent => :destroy
end