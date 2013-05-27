class ReStory < ActiveRecord::Base
  attr_accessible :user_id, :story_comment_id, :content

  belongs_to :user
  belongs_to :story_comment
end