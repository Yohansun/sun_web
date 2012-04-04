class Design < ActiveRecord::Base
  attr_accessible :city, :content, :room_type, :style, :title
  validates_presence_of :title, :content

  belongs_to :user
  has_many :comments
  has_many :design_images, :as => :imageable

  paginates_per 8

  def cover_img
    self.design_images.order("is_cover DESC").first
  end
end
