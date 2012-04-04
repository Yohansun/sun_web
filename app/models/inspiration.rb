class Inspiration < ActiveRecord::Base
	attr_accessible :title, :content, :design_images, :design_image_ids,
		:comments_count, :design_images_count

	has_attached_file :img,
		:styles => {:inside => "188>", :outside => "202>"},
		:whiny_thumbnails => true,
		:url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
		:path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

	validates_presence_of :title, :content

	belongs_to :user
	has_many :comments
	has_many :design_images, :as => :imageable

	paginates_per 8

	def cover_img
		self.design_images.order("is_cover DESC").first
	end
end