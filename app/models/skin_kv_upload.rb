class SkinKvUpload < ActiveRecord::Base
	attr_accessible :kv_thumb, :kv_link, :link_coords
	belongs_to :skins

	has_attached_file :kv_thumb,
										:styles => {:thumb => "105x97#", :kv_thumb=>"670x300#"},
										:whiny_thumbnails => true,
										:url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
										:path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"
end
