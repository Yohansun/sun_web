class StoryImageTag < ActiveRecord::Base
  attr_accessible :image_library_category_id, :story_image_id
  belongs_to :story_image
end
