class Design < ActiveRecord::Base
  attr_accessible :city, :content, :room_type, :style, :title, :design_image_ids
  validates_presence_of :title, :content

  belongs_to :user
  has_many :comments, :as => :commentable
  has_many :votes, :as => :voteable
  has_many :design_images, :as => :imageable

  paginates_per 8

  default_scope :order => "created_at DESC"

  def cover_img
    self.design_images.order("is_cover DESC").first
  end

  def comments_count
    self.comments.size
  end
end