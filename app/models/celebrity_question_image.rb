class CelebrityQuestionImage < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :image
  belongs_to :resource, polymorphic: true
end
