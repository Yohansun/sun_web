class CelebrityCategory < ActiveRecord::Base
  include CelebrityModule
  # attr_accessible :title, :body
  has_many :celebrities

  validate_presence_and_uniqueness_of :name
end