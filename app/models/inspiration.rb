class Inspiration < ActiveRecord::Base
	attr_accessible :title, :content, :design_image_ids, :is_minisite

	validates_presence_of :title, :content

	belongs_to :user
	has_many :comments, :as => :commentable
	has_many :votes, :as => :voteable
	has_many :design_images, :as => :imageable, :dependent => :delete_all, :order => 'is_cover DESC'

	paginates_per 20

	def cover_img
		self.design_images.first
	end

	def comments_count
    self.comments.length
  end
end