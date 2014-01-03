class CelebrityQuestionCategory < ActiveRecord::Base
  include CelebrityModule
  # attr_accessible :title, :body
  acts_as_tree :order => "name"

  has_many :questions, :class_name => CelebrityQuestion

  validate_presence_and_uniqueness_of :name
end
