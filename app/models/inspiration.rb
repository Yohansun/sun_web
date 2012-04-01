class Inspiration < ActiveRecord::Base
	attr_accessible :title, :content, :img
	
	has_attached_file :img, 
										:styles => {:inside => "188>", :outside => "202>"},
										:whiny_thumbnails => true,
										:url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
										:path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

	validates_presence_of :title, :content, :img

	belongs_to :user
	has_many :comments

	paginates_per 8
end
