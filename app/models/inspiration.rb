class Inspiration < ActiveRecord::Base
	attr_accessible :title, :content, :design_image_ids

	validates_presence_of :title, :content

	belongs_to :user
	has_many :comments
	has_many :design_images, :as => :imageable

	paginates_per 8

	def cover_img
		self.design_images.order("is_cover DESC").first
	end
end