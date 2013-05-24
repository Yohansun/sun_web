class StoryUser < ActiveRecord::Base
  attr_accessible :story_id, :user_id, :design_time
  belongs_to :story 
  belongs_to :user
end
