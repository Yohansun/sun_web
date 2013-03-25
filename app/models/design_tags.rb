class DesignTags < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :image_library_category
  delegate :title, :to => :image_library_category,:allow_nil => true
  #取出所有设计风格
  scope :design_style, ->(design_id){where(:image_library_category_id => ImageLibraryCategory.desin_style.map(&:id),:design_id => design_id)}
end
