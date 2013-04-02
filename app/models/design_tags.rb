class DesignTags < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :image_library_category
  belongs_to :design
  delegate :title, :to => :image_library_category,:allow_nil => true
end
